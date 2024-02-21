import 'package:flutter/material.dart';
import 'package:save_money_app/common/common.dart';

//fast_app_base에 있는 버튼을 커스텀

class PostButton extends StatelessWidget {
  const PostButton({
    Key? key,
    this.backgroundColor,
    this.foregroundColor,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? context.colorScheme.primary,
        foregroundColor: foregroundColor ?? context.colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // BorderRadius 설정
        ),
      ),
      child: Text(text),
    );
  }
}