import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// This widget converts its child to a button
class AppButton extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Color? color;
  final Color? colorWhenPressed;
  final FocusNode? focusNode;
  final Size? size;
  final Color? borderColor;

  const AppButton(
      {required this.child,
      required this.onTap,
      this.colorWhenPressed,
      this.focusNode,
      this.color,
      this.size,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(20),
        ),
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onTap,
          color: color,
          child: child,
          borderRadius: BorderRadius.circular(35),
        ),
      ),
    );
  }
}
