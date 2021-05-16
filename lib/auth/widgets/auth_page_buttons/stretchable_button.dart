import 'package:flutter/material.dart';

const double defaultBorderRadius = 3.0;

class StretchableButton extends StatelessWidget {
  final double borderRadius;
  final Color buttonColor;
  final VoidCallback? onPressed;
  final double? buttonPadding;
  final Color? splashColor;
  final Color? buttonBorderColor;
  final List<Widget> children;
  final bool centered;

  StretchableButton({
    required this.buttonColor,
    required this.borderRadius,
    required this.children,
    this.splashColor,
    this.buttonBorderColor,
    this.onPressed,
    this.buttonPadding,
    this.centered = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var contents = List<Widget>.from(children);

        if (constraints.minWidth == 0) {
          contents.add(SizedBox.shrink());
        } else {
          if (centered) {
            contents.insert(0, Spacer());
          }
          contents.add(Spacer());
        }

        BorderSide bs;
        if (buttonBorderColor != null) {
          bs = BorderSide(
            color: buttonBorderColor ?? Colors.white,
          );
        } else {
          bs = BorderSide.none;
        }

        return ButtonTheme(
            height: 40.0,
            padding: EdgeInsets.all(buttonPadding ?? 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: bs,
            ),
            child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(buttonColor),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: contents,
              ),
            ));
      },
    );
  }
}
