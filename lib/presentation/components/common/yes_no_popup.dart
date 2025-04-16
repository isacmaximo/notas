import 'package:flutter/material.dart';
import 'package:notas/presentation/components/common/button_with_icon.dart';
import 'package:notas/presentation/components/common/rounded_container_with_border.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class YesNoPopup extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onYesPressed;
  final VoidCallback onNoPressed;
  const YesNoPopup({
    super.key,
    required this.title,
    required this.message,
    required this.onYesPressed,
    required this.onNoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: RoundedContainerWithBorder(
        width: 80.w,
        height: 20.h,
        padding: EdgeInsets.all(2.w),
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 2.h),
            Text(
              title,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            Text(message, style: TextStyle(fontSize: 16.sp)),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWithIcon(
                  icon: Icons.check,
                  text: 'Sim',
                  onPressed: onYesPressed,
                ),
                ButtonWithIcon(
                  icon: Icons.close,
                  text: 'Não',
                  onPressed: onNoPressed,
                ),
              ],
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}
