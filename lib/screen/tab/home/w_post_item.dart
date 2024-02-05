import 'package:flutter/material.dart';
import 'package:save_money_app/common/extension/datetime_extension.dart';
import 'package:save_money_app/common/widget/animated_height_collapse.dart';
import 'package:save_money_app/screen/tab/home/w_post_item_detail.dart';
import '../../../common/common.dart';
import '../../../data/memory/post_data_holder.dart';
import '../../../data/memory/vo_post.dart';

class PostItem extends StatefulWidget{
  final Post post;

  PostItem(this.post, {super.key});

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> with PostDataProvider{
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
              ///제품과 구매일자
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(child: widget.post.product.text.size(18).bold.make()),
                const Width(10),
                Column(
                  children: [
                    widget.post.purchaseDate.formattedDate.text
                        .size(12)
                        .color(context.appColors.text2)
                        .make(),
                  ],
                ),
              ]),
              const Height(10),
              const Line(),
              const Height(10),

              ///가격
              Row(children: [
                Expanded(
                    child: widget.post.price
                        .toWon()
                        .text
                        .color(context.appColors.text)
                        .size(16)
                        .make()),
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
                  child: PostItemDetail(widget.post)),
            ],
          ).pSymmetric(v: 30, h: 30),
        ),
        ///삭제 버튼
        GestureDetector(
          onTap: (){
            postData.removePost(widget.post);
          },
          child: SizedBox(
            width: 20,
            height: 20,
            child: Icon(Icons.remove_circle,
                color: context.appColors.deleteButton),
          ).pOnly(right: 10, top: 10),
        ),
      ],
    ).pSymmetric(v: 10, h: 30);
  }
}
