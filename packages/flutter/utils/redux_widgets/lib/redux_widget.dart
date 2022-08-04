library redux_widgets;

import 'dart:async';

import 'package:enspyr_redux/redux.dart';
import 'package:flutter/widgets.dart';

import 'errors/store_provider_not_found_error.dart';
import 'exceptions/transform_failure_exception.dart';

class StoreProvider<S extends ReduxState> extends InheritedWidget {
  final ReduxStore<S> _store;

  const StoreProvider({
    Key? key,
    required ReduxStore<S> store,
    required Widget child,
  })  : _store = store,
        super(key: key, child: child);

  static ReduxStore<S> of<S extends ReduxState>(BuildContext context,
      {bool listen = true}) {
    final provider = (listen
        ? context.dependOnInheritedWidgetOfExactType<StoreProvider<S>>()
        : context
            .getElementForInheritedWidgetOfExactType<StoreProvider<S>>()
            ?.widget) as StoreProvider<S>?;

    if (provider == null) throw StoreProviderNotFoundError<S>();

    return provider._store;
  }

  @override
  bool updateShouldNotify(StoreProvider<S> oldWidget) =>
      _store != oldWidget._store;
}

class StoreConnector<S extends ReduxState, VM> extends StatelessWidget {
  final Widget Function(BuildContext context, VM vm) builder;
  final VM Function(S state) transformer;
  final void Function(ReduxStore<S> store)? onInit;
  final void Function(ReduxStore<S> store)? onDispose;

  const StoreConnector({
    Key? key,
    required this.builder,
    required this.transformer,
    this.onInit,
    this.onDispose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _StoreConnectorChild<S, VM>(
      store: StoreProvider.of<S>(context),
      builder: builder,
      transformer: transformer,
      onInit: onInit,
      onDispose: onDispose,
    );
  }
}

class _StoreConnectorChild<S extends ReduxState, VM> extends StatefulWidget {
  final ReduxStore<S> store;
  final Widget Function(BuildContext context, VM vm) builder;
  final VM Function(S state) transformer;
  final void Function(ReduxStore<S> store)? onInit;
  final void Function(ReduxStore<S> store)? onDispose;

  const _StoreConnectorChild({
    Key? key,
    required this.store,
    required this.transformer,
    required this.builder,
    this.onInit,
    this.onDispose,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StoreConnectorChildState<S, VM>();
  }
}

class _StoreConnectorChildState<S extends ReduxState, VM>
    extends State<_StoreConnectorChild<S, VM>> {
  late Stream<VM> _stream;
  VM? _latestValue;
  Object? _latestError;

  // `_latestValue!` would throw _CastError if `VM` is nullable,
  // therefore `_latestValue as VM` is used.
  // https://dart.dev/null-safety/understanding-null-safety#nullability-and-generics
  VM get _requireLatestValue => _latestValue as VM;

  @override
  void initState() {
    super.initState();

    widget.onInit?.call(widget.store);

    _computeLatestValue();
    _createStream();
  }

  @override
  void dispose() {
    widget.onDispose?.call(widget.store);
    super.dispose();
  }

  @override
  void didUpdateWidget(_StoreConnectorChild<S, VM> oldWidget) {
    _computeLatestValue();

    if (widget.store != oldWidget.store) {
      _createStream();
    }

    super.didUpdateWidget(oldWidget);
  }

  void _computeLatestValue() {
    try {
      _latestError = null;
      _latestValue = widget.transformer(widget.store.state);
    } catch (e, s) {
      _latestValue = null;
      _latestError = TransformFailureException(e, s);
    }
  }

  void _createStream() {
    _stream = widget.store.stateChanges
        .map((_) => widget.transformer(widget.store.state))
        .transform(StreamTransformer.fromHandlers(
            handleError: _handleTransformFailure))
        .where((vm) => vm != _latestValue)
        .transform(StreamTransformer.fromHandlers(handleData: _handleChange))
        .transform(StreamTransformer.fromHandlers(handleError: _handleError));
  }

  void _handleTransformFailure(
    Object error,
    StackTrace stackTrace,
    EventSink<VM> sink,
  ) {
    sink.addError(TransformFailureException(error, stackTrace), stackTrace);
  }

  // After each VM is emitted from the Stream, we update the
  // latestValue. Important: This must be done after all other optional
  // transformations, such as ignoreChange.
  void _handleChange(VM vm, EventSink<VM> sink) {
    _latestError = null;
    _latestValue = vm;
    sink.add(vm);
  }

  // Handle any errors from transformer/onWillChange/onDidChange
  void _handleError(
    Object error,
    StackTrace stackTrace,
    EventSink<VM> sink,
  ) {
    _latestValue = null;
    _latestError = error;
    sink.addError(error, stackTrace);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<VM>(
      stream: _stream,
      builder: (context, snapshot) {
        if (_latestError != null) throw _latestError!;

        return widget.builder(context, _requireLatestValue);
      },
    );
  }
}
