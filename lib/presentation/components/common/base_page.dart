import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class BasePage extends StatelessWidget {
  final Widget child;
  final String title;
  final Widget? floatingActionButton;
  final Widget? leading;
  final List<Widget>? persistentFooterButtons;

  const BasePage({
    super.key,
    required this.child,
    required this.title,
    this.floatingActionButton,
    this.leading,
    this.persistentFooterButtons,
  });

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            surfaceTintColor: Colors.black,
            elevation: 0,
            title: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,

            leading: leading,
          ),
          body: child,
          floatingActionButton: floatingActionButton,
          persistentFooterButtons: persistentFooterButtons,
        ),
      ),
    );
  }
}
