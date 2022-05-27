import 'package:flutter/material.dart';

/// The message shown to the user.
class IconSnackBarText extends StatelessWidget {
  /// The text used.
  final String text;

  /// The color of the text.
  final Color? color;

  const IconSnackBarText({Key? key, required this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: _contentTextStyle(context).copyWith(color: color),
      );

  TextStyle _contentTextStyle(BuildContext context) =>
      Theme.of(context).snackBarTheme.contentTextStyle ?? const TextStyle();
}
