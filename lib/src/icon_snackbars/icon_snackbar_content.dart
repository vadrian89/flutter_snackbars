import 'package:flutter/material.dart';

import 'icon_snackbar_icon.dart';
import 'icon_snackbar_strip.dart';
import 'icon_snackbar_text.dart';

/// The content of the snackbar.
class IconSnackBarContent extends StatelessWidget {
  /// The color of the text, icon and message.
  final Color? foregroundColor;

  /// The icon used.
  final Widget icon;

  /// The action which appears at the end of the snackbar.
  final SnackBarAction? action;

  /// The message shown to the user.
  final String message;

  const IconSnackBarContent({
    Key? key,
    this.foregroundColor,
    this.action,
    required this.icon,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          IconSnackBarStrip(color: foregroundColor),
          const SizedBox(width: 10),
          IconSnackBarIcon(icon: icon, color: foregroundColor),
          const SizedBox(width: 10),
          IconSnackBarText(text: message, color: foregroundColor),
          if (action != null) ...[
            const Spacer(),
            action!,
            const SizedBox(width: 10),
          ]
        ],
      );

  /// Update the [color] value and rebuild the widget.
  IconSnackBarContent updateForegroundColor(Color color, [String? message]) => IconSnackBarContent(
        icon: icon,
        message: message ?? this.message,
        action: action,
        foregroundColor: color,
      );
}
