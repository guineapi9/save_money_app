import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../../common/theme/theme_util.dart';

class SettingItem extends StatefulWidget {
  final String text1;
  final Widget child;

  const SettingItem(this.text1, {super.key, required this.child});

  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.text1.text.make(),
              ExpandedButton(isExpanded, onTap: (){
                setState(() {
                  isExpanded = !isExpanded;
                });
              }),
            ],
          ),
          AnimatedHeightCollapse(
              visible: isExpanded,
              child: widget.child.pOnly(top: 15),
              ),
        ],
      ),
    );
  }
}
