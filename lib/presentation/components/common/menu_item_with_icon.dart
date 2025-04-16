import 'package:flutter/material.dart';

class MenuItemWithIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const MenuItemWithIcon({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
          SizedBox(width: 10),
          Icon(icon, color: iconColor),
        ],
      ),
    );
  }
}
