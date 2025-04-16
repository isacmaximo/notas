import 'package:flutter/material.dart';
import 'package:notas/presentation/components/common/yes_no_popup.dart';

class PopupUtils {
  static Future<void> showYesNoPopup(
    BuildContext context,
    String title,
    String message,
    VoidCallback onYesPressed,
    VoidCallback onNoPressed,
  ) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return YesNoPopup(
          title: title,
          message: message,
          onYesPressed: onYesPressed,
          onNoPressed: onNoPressed,
        );
      },
    );
  }
}
