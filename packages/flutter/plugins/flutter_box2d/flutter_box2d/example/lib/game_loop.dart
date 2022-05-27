import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';

/// The game loop is just a [Ticker] that calls [callback] on each frame.
/// The value [elapsed], the time since the last frame (in seconds), is calculated
/// each tick and passed in to [callback].
class GameLoop {
  GameLoop({required this.onTick, bool startImmediately = true}) {
    _ticker = Ticker(_tick);
    if (startImmediately) start();
  }

  /// A function that is called every frame, with the elapsed time since last frame.
  void Function(double elapsed) onTick;

  /// A [ValueNotifier] that is updated every frame with the elapsed time since last frame.
  final tickNotifier = ValueNotifier<double>(0);

  /// Total time passed, up to the previous frame.
  Duration _previous = Duration.zero;

  /// A [Ticker] that calls [callback] on each tick.
  late final Ticker _ticker;

  /// Called by the [Ticker] on every frame.
  void _tick(Duration current) {
    var deltaDuration = current - _previous;
    _previous = current;

    final elapsed =
        deltaDuration.inMicroseconds / Duration.microsecondsPerSecond;

    onTick(elapsed);
    tickNotifier.value = elapsed;
  }

  void start() {
    if (!_ticker.isActive) {
      _ticker.start();
    }
  }

  void stop() {
    _ticker.stop();
    _previous = Duration.zero;
  }

  /// See docs for [Ticker.dispose]
  void dispose() {
    _ticker.dispose();
  }
}
