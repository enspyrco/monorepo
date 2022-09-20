import 'dart:async';

import 'package:astro/astro.dart' as astro;
import 'package:flutter/widgets.dart';

import '../exceptions/transform_failure_exception.dart';
import 'store_provider.dart';

class StateStreamBuilder<S extends astro.RootState, VM>
    extends StatelessWidget {
  final Widget Function(BuildContext context, VM vm) builder;
  final VM Function(S state) transformer;
  final void Function(astro.Store<S> store)? onInit;
  final void Function(astro.Store<S> store)? onDispose;

  const StateStreamBuilder({
    Key? key,
    required this.builder,
    required this.transformer,
    this.onInit,
    this.onDispose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _StateStreamBuilder<S, VM>(
      store: StoreProvider.of<S>(context),
      builder: builder,
      transformer: transformer,
      onInit: onInit,
      onDispose: onDispose,
    );
  }
}

class _StateStreamBuilder<S extends astro.RootState, VM>
    extends StatefulWidget {
  final astro.Store<S> store;
  final Widget Function(BuildContext context, VM vm) builder;
  final VM Function(S state) transformer;
  final void Function(astro.Store<S> store)? onInit;
  final void Function(astro.Store<S> store)? onDispose;

  const _StateStreamBuilder({
    Key? key,
    required this.store,
    required this.transformer,
    required this.builder,
    this.onInit,
    this.onDispose,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StateStreamBuilderState<S, VM>();
  }
}

class _StateStreamBuilderState<S extends astro.RootState, VM>
    extends State<_StateStreamBuilder<S, VM>> {
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
  void didUpdateWidget(_StateStreamBuilder<S, VM> oldWidget) {
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
    _stream = widget.store.onStateChange
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
