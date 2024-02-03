import 'package:flutter/material.dart';
import 'package:save_money_app/common/extension/context_extension.dart';
import 'package:save_money_app/common/widget/animated_height_collapse.dart';
import 'package:save_money_app/screen/tab/home/w_post_item_detail.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../common/common.dart';
import '../../../common/widget/w_dottedline.dart';

class PostItem extends StatefulWidget {
  const PostItem({super.key});

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  final duration = const Duration(milliseconds: 300);
  bool isExpanded = false;
  static const iconSize = 12.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            //borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //제목과 날짜
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(child: '아이패드 미니 6 256G'.text.size(18).bold.make()),
                const Width(10),
                Column(
                  children: [
                    '2023/11/10'
                        .text
                        .size(12)
                        .color(context.appColors.text2)
                        .make(),
                  ],
                ),
              ]),
              const Height(10),
              const Line(),
              const Height(10),

              //제목과 날짜
              Row(children: [
                Expanded(
                    child: '500,000원'
                        .text
                        .color(context.appColors.text)
                        .size(16)
                        .make()
                    ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: AnimatedContainer(
                    duration: duration,
                    width: iconSize * 2,
                    height: iconSize * 2,
                    decoration: BoxDecoration(
                      color: context.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(iconSize),
                    ),
                    child: AnimatedRotation(
                      turns: isExpanded ? 0.25 : 0,
                      duration: duration,
                      child: Icon(Icons.arrow_forward_ios,
                          size: iconSize,
                          color: context.colorScheme.onPrimaryContainer),
                    ),
                  ),
                )
              ]),
              AnimatedHeightCollapse(
                  visible: isExpanded,
                  duration: duration,
                  child: const PostItemDetail()),
            ],
          ).pSymmetric(v: 30, h: 30),
        ),
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: context.colorScheme.background),
        ).pOnly(right: 10, top: 10),
      ],
    ).pSymmetric(v: 10, h: 30);
  }
}
