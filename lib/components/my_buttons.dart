import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;

  const MyButtons({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(25),
        child: child
        ),
    );
  }
}
