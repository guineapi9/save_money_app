import 'package:flutter/material.dart';

import '../../../common/common.dart';

class SettingButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String content;

  const SettingButton(this.title, this.content, {super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
          child: Row(
        children: [
          title.text.bold.make(),
          content.text.make(),
          const Spacer(),
          Icon(Icons.arrow_forward_ios,
              size: 15, color: context.colorScheme.primary),
        ],
      )).pOnly(bottom: 10),
    );
  }
}
