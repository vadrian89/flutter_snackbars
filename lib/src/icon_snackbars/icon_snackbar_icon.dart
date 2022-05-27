import 'package:flutter/material.dart';

/// The icon of the snackbar shown before the message.
class IconSnackBarIcon extends StatelessWidget {
  /// The icon widget.
  final Widget icon;

  /// The color of the [icon], if it's of type [Icon].
  final Color? color;

  const IconSnackBarIcon({Key? key, required this.icon, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 20,
        width: 20,
        child: Center(
          child: Theme(
            data: Theme.of(context).copyWith(
              iconTheme: IconTheme.of(context).copyWith(
                color: color ?? _fallbackColor(context),
                size: 20,
              ),
            ),
            child: icon,
          ),
        ),
      );

  Color _fallbackColor(BuildContext context) =>
      MediaQuery.of(context).platformBrightness == Brightness.light
          ? Theme.of(context).colorScheme.onSurface
          : Theme.of(context).colorScheme.surface;
}
