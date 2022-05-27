import 'package:flutter/material.dart';
import 'package:flutter_snackbars/src/icon_snackbars/icon_snackbar_content.dart';

import 'src/enhanced_snackbar.dart';

/// A snackbar which displays a message to the user with an icon shown above the message.
class IconSnackBar extends EnhancedSnackBar {
  const IconSnackBar._({
    Key? key,
    required Widget content,
    Color? backgroundColor,
    Duration? duration,
    double? width,
  }) : super(
          key: key,
          content: content,
          backgroundColor: backgroundColor,
          behavior: SnackBarBehavior.floating,
          duration: duration ?? const Duration(seconds: 4),
          width: width,
          padding: EdgeInsets.zero,
        );

  /// Build a snackbar which displays a text message, followed by an optional icon.
  factory IconSnackBar.base({
    /// The message displayed to the user.
    required String message,

    /// Icon showed at the end of the snackbar.
    required Widget icon,

    /// The value [SnackBar.backgroundColor].
    Color? backgroundColor,

    /// The color of the foreground elements, such as: icon, text and the stripe on the left.
    Color? foregroundColor,

    /// How many seconds is the message displayed.
    int? duration,

    /// The value [SnackBar.width].
    double? width,

    /// Action button set at the end of the snackbar.
    SnackBarAction? action,

    /// A builder method in case there is need to add custom parent widgets on top of the content.
    Widget Function(BuildContext context, IconSnackBarContent child)? builder,
  }) =>
      IconSnackBar._(
        width: width,
        backgroundColor: backgroundColor,
        duration: Duration(seconds: duration ?? 4),
        content: (builder != null)
            ? Builder(
                builder: (context) => builder(
                  context,
                  IconSnackBarContent(
                    icon: icon,
                    foregroundColor: foregroundColor,
                    message: message,
                    action: action,
                  ),
                ),
              )
            : IconSnackBarContent(
                icon: icon,
                foregroundColor: foregroundColor,
                message: message,
                action: action,
              ),
      );

  /// Build a snackbar which displays an error message to the user.
  factory IconSnackBar.error({
    /// The message displayed to the user.
    required String message,

    /// The value [SnackBar.width].
    double? width,

    /// The value [SnackBar.backgroundColor].
    Color? backgroundColor,

    /// The color of the foreground elements, such as: icon, message and the strip on the left.
    Color? foregroundColor,
  }) =>
      IconSnackBar.base(
        width: width,
        backgroundColor: backgroundColor ?? Colors.red[50],
        foregroundColor: foregroundColor ?? Colors.red,
        message: message,
        icon: const Icon(Icons.error),
      );

  /// Build a snackbar which displays a success message to the user.
  factory IconSnackBar.success({
    /// The message displayed to the user.
    required String message,

    /// The value [SnackBar.width].
    double? width,

    /// The value [SnackBar.backgroundColor].
    Color? backgroundColor,

    /// The color of the foreground elements, such as: icon, message and the strip on the left.
    Color? foregroundColor,
  }) =>
      IconSnackBar.base(
        width: width,
        message: message,
        backgroundColor: backgroundColor ?? Colors.green[50],
        foregroundColor: foregroundColor ?? Colors.green,
        icon: const Icon(Icons.check),
      );

  /// Build a snackbar which indicates that an a long operation is in progress.
  factory IconSnackBar.loading({
    /// The message displayed to the user.
    required String message,

    /// The value [SnackBar.width].
    double? width,

    /// The value [SnackBar.backgroundColor].
    Color? backgroundColor,

    /// The color of the foreground elements, such as: icon, message and the strip on the left.
    Color? foregroundColor,
  }) =>
      IconSnackBar.base(
        width: width,
        duration: 600,
        message: message,
        icon: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(foregroundColor ?? Colors.blue),
          strokeWidth: 2,
        ),
        backgroundColor: backgroundColor ?? Colors.blue[50],
        foregroundColor: foregroundColor ?? Colors.blue,
      );
}
