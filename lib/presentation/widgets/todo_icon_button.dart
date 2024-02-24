import 'package:flutter/material.dart';
import 'package:testing_app/core/constants/app_color.dart';

class TodoIconButton extends StatelessWidget {
  const TodoIconButton({
    required this.onPressed,
    required this.icon,
    this.iconColor = ColorsApp.white,
    super.key,
  });

  final Function onPressed;
  final IconData icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onPressed(),
      icon: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}