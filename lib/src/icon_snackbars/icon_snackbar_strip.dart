import 'package:flutter/material.dart';

/// A strip of color at the start of the snackbar, for aesthetics reasons.
class IconSnackBarStrip extends StatelessWidget {
  /// The color of the strip.
  ///
  /// If no color is used, then it defaults depending on the [MediaQueryData.platformBrightness].
  /// When [Brightness.light] is reported by the system, then [ThemeData.primaryColorLight] is used,
  /// otherwise [ThemeData.primaryColorDark] is used.
  final Color? color;

  const IconSnackBarStrip({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: 6,
        height: 48,
        decoration: ShapeDecoration(
          color: color ?? Theme.of(context).colorScheme.onSurface,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              bottomLeft: Radius.circular(4),
            ),
          ),
        ),
      );
}
