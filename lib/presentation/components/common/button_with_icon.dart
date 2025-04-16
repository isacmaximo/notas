import 'package:flutter/material.dart';
import 'package:notas/presentation/components/common/rounded_container_with_border.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ButtonWithIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;

  const ButtonWithIcon({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: RoundedContainerWithBorder(
        color: backgroundColor ?? Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 2.w),
        child: Row(
          children: [
            Text(
              text,

              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: textColor ?? Colors.amber[800],
              ),
            ),
            SizedBox(width: 2.w),
            Icon(icon, size: 20.sp, color: iconColor ?? Colors.amber[800]),
          ],
        ),
      ),
    );
  }
}
