import 'package:flutter/material.dart';

class RoundedContainerWithBorder extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final double? radius;
  final double? borderWidth;

  const RoundedContainerWithBorder({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.color,
    this.padding,
    this.margin,
    this.borderRadius,
    this.border,
    this.boxShadow,
    this.radius,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius ?? 10),
        border: Border.all(width: borderWidth ?? 1),
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
