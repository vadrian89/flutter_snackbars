import 'package:flutter/material.dart';

import 'src/enhanced_snackbar.dart';

/// A snackbar which displays a message to the user.
class MessageSnackBar extends EnhancedSnackBar {
  const MessageSnackBar._({
    Key? key,
    required Widget content,
    Color? backgroundColor,
    SnackBarBehavior? behavior,
    Duration? duration,
    double? width,
  }) : super(
          key: key,
          content: content,
          backgroundColor: backgroundColor,
          behavior: behavior,
          duration: duration ?? const Duration(seconds: 4),
          width: width,
        );

  /// Build a snackbar which displays a text message, followed by an optional icon.
  factory MessageSnackBar.base({
    /// The message displayed to the user.
    required String message,

    /// Icon showed at the end of the snackbar.
    Widget? icon,

    /// The value [SnackBar.behavior].
    SnackBarBehavior? behavior,

    /// The value [SnackBar.backgroundColor].
    Color? backgroundColor,

    /// The text style of the [message].
    TextStyle? messageStyle,

    /// How many seconds is the message displayed.
    int? duration,

    /// The value [SnackBar.width].
    double? width,
  }) =>
      MessageSnackBar._(
        behavior: behavior,
        width: width,
        backgroundColor: backgroundColor,
        duration: Duration(seconds: duration ?? 4),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(message, style: messageStyle),
            ),
            if (icon != null) icon,
          ],
        ),
      );

  /// Build a snackbar which displays an error message to the user.
  factory MessageSnackBar.error({
    /// The message displayed to the user.
    required String message,

    /// The value [SnackBar.behavior].
    SnackBarBehavior? behavior,

    /// The value [SnackBar.width].
    double? width,
  }) =>
      MessageSnackBar.base(
        behavior: behavior,
        width: width,
        backgroundColor: Colors.red,
        messageStyle: const TextStyle(color: Colors.white),
        message: message,
        icon: const Icon(Icons.error, color: Colors.white),
      );

  /// Build a snackbar which displays a success message to the user.
  factory MessageSnackBar.success({
    /// The message displayed to the user.
    required String message,

    /// The value [SnackBar.behavior].
    SnackBarBehavior? behavior,

    /// The value [SnackBar.width].
    double? width,
  }) =>
      MessageSnackBar.base(
        behavior: behavior,
        width: width,
        message: message,
        icon: Builder(
          builder: (context) => Icon(Icons.check, color: Theme.of(context).primaryColor),
        ),
      );

  /// Build a snackbar which indicates that an a long operation is in progress.
  factory MessageSnackBar.loading({
    /// The message displayed to the user.
    required String message,

    /// The value [SnackBar.behavior].
    SnackBarBehavior? behavior,

    /// The value [SnackBar.width].
    double? width,
  }) =>
      MessageSnackBar.base(
        behavior: behavior,
        width: width,
        duration: 600,
        message: message,
        icon: Builder(
          builder: (context) => CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          ),
        ),
      );
}
