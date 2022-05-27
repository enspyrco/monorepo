import 'package:flutter/material.dart';

import '../../../shared/widgets/stretchable_button.dart';

const double defaultBorderRadius = 3.0;

enum GitHubButtonStyle { white, whiteOutline, black }

/// A sign in button that (plans to) match GitHub's design guidelines.
class GitHubSignInButton extends StatelessWidget {
  final String text;
  final GitHubButtonStyle style;
  final double borderRadius;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final Color? splashColor;
  final bool centered;

  /// Creates a new button. Set [darkMode] to `true` to use the dark
  /// black background variant with white text, otherwise an all-white background
  /// with dark text is used.
  const GitHubSignInButton(
      {this.onPressed,
      this.text = 'Sign in with GitHub',
      this.textStyle,
      this.splashColor,
      this.style = GitHubButtonStyle.white,
      this.borderRadius = defaultBorderRadius,
      this.centered = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StretchableButton(
      buttonColor:
          style == GitHubButtonStyle.black ? Colors.black : Colors.white,
      borderRadius: borderRadius,
      splashColor: splashColor,
      buttonBorderColor:
          style == GitHubButtonStyle.whiteOutline ? Colors.black : null,
      onPressed: onPressed,
      buttonPadding: 0.0,
      centered: centered,
      children: <Widget>[
        Center(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 22.0, bottom: 3.0),
                child: Container(
                  height: 38.0,
                  width: 32.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  child: const Center(
                    child: Image(
                      image:
                          AssetImage("assets/github.png", package: 'redfire'),
                      height: 17.0,
                      width: 17.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 8.0, 32.0, 8.0),
                child: Text(
                  text,
                  style: textStyle ??
                      TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w500,
                        color: style == GitHubButtonStyle.black
                            ? Colors.white
                            : Colors.black,
                      ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
