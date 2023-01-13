import 'package:flutter/material.dart';

import 'drop_target.dart';

class DropNotifier extends StatelessWidget {
  final Widget child;

  const DropNotifier({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: DropTarget.instance,
      builder: (context, value, builderChild) {
        return Stack(
          children: [
            builderChild!,
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              decoration: BoxDecoration(
                border: Border.all(
                  color: value ? Colors.green : Colors.transparent,
                  width: 8,
                ),
              ),
            ),
          ],
        );
      },
      child: child,
    );
  }
}
