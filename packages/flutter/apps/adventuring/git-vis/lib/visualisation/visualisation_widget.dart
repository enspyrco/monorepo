import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../git/git_objects/commit_tree.dart';
import '../git/object_database.dart';
import 'visual_objects/area_visual.dart';
import 'visual_objects/commit_tree_visual.dart';
import 'visualisation_painter.dart';

class VisualisationWidget extends StatefulWidget {
  const VisualisationWidget({Key? key}) : super(key: key);

  @override
  State<VisualisationWidget> createState() => _VisualisationWidgetState();
}

/// We use a [Ticker] that calls [_onTick] on each frame.
/// The value [elapsed], the time since the last frame (in seconds), is calculated
/// each tick and passed in to [_onTick].
class _VisualisationWidgetState extends State<VisualisationWidget>
    with SingleTickerProviderStateMixin {
  final CommitTree _tree =
      CommitTree.walkAndParse(branches: ObjectDatabase.getBranches());

  /// A [Ticker] that calls [_onTick] on each tick.
  late final Ticker _ticker = Ticker(_onTick);

  /// Total time passed, up to the previous frame.
  Duration _previous = Duration.zero;

  /// A [ValueNotifier] that we update every frame with the elapsed time.
  final _tickNotifier = ValueNotifier<double>(0);

  ///
  CommitTreeVisual? _treeVisual;

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
    return LayoutBuilder(builder: (context, constraints) {
      // Create the area visual - the space the tree lives in.
      var area = AreaVisual(constraints.maxWidth, constraints.maxHeight,
          const Color.fromARGB(170, 9, 116, 165));
      _treeVisual = _tree.createVisual(area);

      return CustomPaint(
        painter: VisualisationPainter(
          area: area,
          tree: _treeVisual!,
          notifiyRepaint: _tickNotifier,
        ),
      );
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
