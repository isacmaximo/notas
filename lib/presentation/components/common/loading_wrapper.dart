import 'package:flutter/material.dart';

class LoadingWrapper extends StatelessWidget {
  final Widget? child;
  final bool isLoading;
  final double? height;
  final double? width;

  const LoadingWrapper({
    super.key,
    this.child,
    required this.isLoading,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child ?? Container(),
        if (isLoading)
          Opacity(
            opacity: 0.7,
            child: Container(
              color: Colors.black,
              height: height,
              width: width,
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
      ],
    );
  }
}
