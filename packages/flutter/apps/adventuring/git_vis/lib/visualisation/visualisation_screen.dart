import 'package:astro/astro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../app/state/app_state.dart';
import '../git/models/git_objects/commit_tree_state.dart';
import 'visual_objects/area_visual.dart';
import 'visual_objects/commit_tree_visual.dart';
import 'visualisation_painter.dart';

class VisualisationScreen extends StatefulWidget {
  const VisualisationScreen({Key? key}) : super(key: key);

  @override
  State<VisualisationScreen> createState() => _VisualisationScreenState();
}

/// We use a [Ticker] that calls [_onTick] on each frame.
/// The value [elapsed], the time since the last frame (in seconds), is calculated
/// each tick and passed in to [_onTick].
class _VisualisationScreenState extends State<VisualisationScreen>
    with SingleTickerProviderStateMixin {
  /// The visual part of the commit tree that is part of the object database.
  CommitTreeVisual? _treeVisual;

  /// A [Ticker] that calls [_onTick] on each tick.
  late final Ticker _ticker = Ticker(_onTick);

  /// Total time passed, up to the previous frame.
  Duration _previous = Duration.zero;

  /// A [ValueNotifier] that we update every frame with the elapsed time.
  final _tickNotifier = ValueNotifier<double>(0);

  @override
  void initState() {
    super.initState();
    startSimulation();
  }

  /// Called by the [Ticker] on every frame.
  void _onTick(Duration current) {
    var deltaDuration = current - _previous;
    _previous = current;

    final elapsed =
        deltaDuration.inMicroseconds / Duration.microsecondsPerSecond;

    if (mounted) _treeVisual?.moveForwardInTimeBy(elapsed);

    _tickNotifier.value = elapsed;
  }

  @override
  Widget build(BuildContext context) {
    return OnStateChangeBuilder<AppState, CommitTreeState>(
        transformer: (state) => state.odb.commitTree,
        builder: (context, commitTree) {
          return LayoutBuilder(builder: (context, constraints) {
            // The area visual is the space the tree lives in - we need to create the
            // area visual first so the tree visual knows the bounds of the area it
            // has to work with.
            final area = AreaVisual.from(constraints);
            _treeVisual = CommitTreeVisual(state: commitTree, within: area);

            return CustomPaint(
              painter: VisualisationPainter(
                area: area,
                tree: _treeVisual!,
                notifiyRepaint: _tickNotifier,
              ),
            );
          });
        });
  }

  void startSimulation() {
    if (!_ticker.isActive) {
      _ticker.start();
    }
  }

  void stopSimulation() {
    _ticker.stop();
    _previous = Duration.zero;
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }
}
