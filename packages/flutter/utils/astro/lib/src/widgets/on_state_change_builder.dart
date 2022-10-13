import 'dart:async';

import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:flutter/widgets.dart';

import 'exceptions/transform_failure_exception.dart';

class OnStateChangeBuilder<S extends AstroState, VM> extends StatelessWidget {
  final VM Function(S state) transformer;
  final Widget Function(BuildContext context, VM vm) builder;
  final void Function(MissionControl<S>)? onInit;
  final void Function(MissionControl<S>)? onDispose;

  const OnStateChangeBuilder({
    Key? key,
    required this.transformer,
    required this.builder,
    this.onInit,
    this.onDispose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _OnStateChangeBuilder<S, VM>(
      missionControl: locate<MissionControl<S>>(),
      builder: builder,
      transformer: transformer,
      onInit: onInit,
      onDispose: onDispose,
    );
  }
}

class _OnStateChangeBuilder<S extends AstroState, VM> extends StatefulWidget {
  final MissionControl<S> missionControl;
  final Widget Function(BuildContext, VM) builder;
  final VM Function(S) transformer;
  final void Function(MissionControl<S>)? onInit;
  final void Function(MissionControl<S>)? onDispose;

  const _OnStateChangeBuilder({
    Key? key,
    required this.missionControl,
    required this.transformer,
    required this.builder,
    this.onInit,
    this.onDispose,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OnStateChangeBuilderState<S, VM>();
  }
}

class _OnStateChangeBuilderState<S extends AstroState, VM>
    extends State<_OnStateChangeBuilder<S, VM>> {
  late Stream<VM> _stream;
  VM? _previous;
  Object? _latestError;

  // `_latestValue!` would throw _CastError if `VM` is nullable,
  // therefore `_latestValue as VM` is used.
  // https://dart.dev/null-safety/understanding-null-safety#nullability-and-generics
  VM get _requireLatestValue => _previous as VM;

  @override
  void initState() {
    super.initState();

    widget.onInit?.call(widget.missionControl);

    _computeLatestValue();
    _createStream();
  }

  @override
  void dispose() {
    widget.onDispose?.call(widget.missionControl);
    super.dispose();
  }

  @override
  void didUpdateWidget(_OnStateChangeBuilder<S, VM> oldWidget) {
    _computeLatestValue();

    if (widget.missionControl != oldWidget.missionControl) {
      _createStream();
    }

    super.didUpdateWidget(oldWidget);
  }

  void _computeLatestValue() {
    try {
      _latestError = null;
      _previous = widget.transformer(widget.missionControl.state);
    } catch (e, s) {
      _previous = null;
      _latestError = TransformFailureException(e, s);
    }
  }

  void _createStream() {
    _stream = widget.missionControl.onStateChange
        .map((_) => widget.transformer(widget.missionControl.state))
        .transform(StreamTransformer.fromHandlers(
            handleError: _handleTransformFailure))
        .where((vm) => vm != _previous)
        .transform(StreamTransformer.fromHandlers(handleData: _updatePrevious))
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
  void _updatePrevious(VM vm, EventSink<VM> sink) {
    _latestError = null;
    _previous = vm;
    sink.add(vm);
  }

  // Handle any errors from transformer/onWillChange/onDidChange
  void _handleError(
    Object error,
    StackTrace stackTrace,
    EventSink<VM> sink,
  ) {
    _previous = null;
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
