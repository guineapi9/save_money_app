import 'package:flutter/material.dart';
import 'package:save_money_app/common/common.dart';

class ExpandedButton extends StatefulWidget {
  bool isExpanded = false;
  final VoidCallback onTap;

  ExpandedButton(this.isExpanded, {super.key, required this.onTap});

  @override
  State<ExpandedButton> createState() => _ExpandedButtonState();
}

class _ExpandedButtonState extends State<ExpandedButton> {
  static const Duration duration = Duration(milliseconds: 300);
  static const iconSize = 12.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: duration,
        width: iconSize * 2,
        height: iconSize * 2,
        decoration: BoxDecoration(
          color: context.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(iconSize),
        ),
        child: AnimatedRotation(
          turns: widget.isExpanded ? 0.25 : 0,
          duration: duration,
          child: Icon(Icons.arrow_forward_ios,
              size: iconSize,
              color: context.colorScheme.onPrimaryContainer),
        ),
      ),
    );
  }
}
