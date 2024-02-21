import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:save_money_app/common/common.dart';
import 'package:save_money_app/common/extension/datetime_extension.dart';

import '../../../common/widget/bottom_dialog_scaffold.dart';
import '../../../data/memory/vo_post.dart';

class PostItemDetailDialog extends DialogWidget {
  final Post post;

  PostItemDetailDialog(this.post, {super.key});

  @override
  DialogState<PostItemDetailDialog> createState() =>
      _PostItemDetailDialogState();
}

class _PostItemDetailDialogState extends DialogState<PostItemDetailDialog> {
  @override
  Widget build(BuildContext context) {
    return BottomDialogScaffold(
      body: Column(
        children: [
          ///제품
          widget.post.product.text.size(20).bold.make(),
          const Height(20),

          ///구매일자
          Row(
            children: [
              '구매 일자'.text.size(16).bold.make(),
              const Spacer(),
              widget.post.purchaseDate.formattedDate.text
                  .size(12)
                  .color(context.appColors.text2)
                  .make(),
            ],
          ),
          const Height(10),
          const MySeparator(
            color: Colors.grey,
          ),
          const Height(10),

          ///가격
          Row(
            children: [
              '가격'.text.size(16).bold.make(),
              const Spacer(),
              widget.post.price.toWon().text.make(),
            ],
          ),
          const Height(10),
          const MySeparator(
            color: Colors.grey,
          ),
          const Height(10),

          ///구매한 이유
          Row(
          children: [
            '구매한 이유'.text.size(16).bold.make(),
            const Width(20),
            Expanded(
              child: widget.post.reason.text
                  .color(context.colorScheme.onPrimaryContainer)
                  .align(TextAlign.end)
                  .make(),
            ),
          ]),
          const Height(10),
          const MySeparator(
            color: Colors.grey,
          ),
          const Height(10),

          ///다짐
          Row(children: [
            '다짐'.text.size(16).bold.make(),
            const Width(60),
            Expanded(child: widget.post.promise.text.align(TextAlign.end).make()),
          ]),
          const Height(20),

          ///닫기 버튼
          Row(
            children: [
              const Spacer(),
              PostButton(
                  text: "닫기",
                  onPressed: () {
                    widget.hide();
                  }),
            ],
          )
        ],
      ).p(30),
    );
  }
}
