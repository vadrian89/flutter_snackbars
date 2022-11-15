library enhanced_snackbar;

import 'package:flutter/material.dart';

class EnhancedSnackBar extends SnackBar {
  const EnhancedSnackBar({
    super.key,
    required super.content,
    super.duration = const Duration(seconds: 4),
    super.width,
    super.backgroundColor,
    super.elevation,
    super.margin,
    super.padding,
    super.shape,
    super.action,
    super.behavior,
  });

  /// Display the snackbar on the nearest [Scaffold].
  ///
  /// It hides any other snackbar currently shown.
  void show(BuildContext context) => ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(this);
}
