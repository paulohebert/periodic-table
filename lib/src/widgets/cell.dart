import 'dart:math';

import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  const Cell(
      {super.key,
      required this.child,
      required this.color,
      required this.onTap});

  final Widget child;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: max(MediaQuery.sizeOf(context).width / 18, 100),
      duration: const Duration(seconds: 2),
      curve: Curves.easeIn,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onTap,
            child: Ink(
              decoration:
                  BoxDecoration(border: Border.all(width: 0.25), color: color),
              child: SizedBox.expand(child: child),
            )),
      ),
    );
  }
}
