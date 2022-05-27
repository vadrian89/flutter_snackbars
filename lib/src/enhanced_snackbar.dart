library enhanced_snackbar;

import 'package:flutter/material.dart';

class EnhancedSnackBar extends SnackBar {
  const EnhancedSnackBar({
    Key? key,
    required Widget content,

    /// The duration, in seconds, which the snackbar will be shown.
    Duration duration = const Duration(seconds: 4),

    /// The value [SnackBar.width].
    double? width,

    /// The color of foreground widgets, such as texts.
    Color? foregroundColor,

    /// The value [SnackBar.backgroundColor].
    Color? backgroundColor,

    /// The value [SnackBar.elevation].
    double? elevation,

    /// The value [SnackBar.margin].
    EdgeInsetsGeometry? margin,

    /// The value [SnackBar.padding].
    EdgeInsetsGeometry? padding,

    /// The value [SnackBar.shape].
    ShapeBorder? shape,

    /// The value [SnackBar.action].
    SnackBarAction? action,

    /// The value [SnackBar.behavior].
    SnackBarBehavior? behavior,
  }) : super(
          key: key,
          content: content,
          behavior: behavior,
          width: width,
          backgroundColor: backgroundColor,
          elevation: elevation,
          margin: margin,
          shape: shape,
          action: action,
          duration: duration,
        );

  /// Display the snackbar on the nearest [Scaffold].
  ///
  /// It hides any other snackbar currently shown.
  void show(BuildContext context) => ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(this);
}
