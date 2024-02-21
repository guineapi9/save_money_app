import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../../data/memory/vo_post.dart';

class PostItemDetail extends StatelessWidget {
  final Post post;

  const PostItemDetail(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Height(10),
        const MySeparator(
          color: Colors.grey,
        ),
        const Height(10),
        Row(children: [
          '구매한 이유'.text.size(16).bold.make(),
          const Spacer(),
          post.isNecessary ? '필요'.text.size(16).bold.make() : '불필요'.text.size(16).color(context.appColors.redBlue).bold.make(),
        ]),
        const Height(5),
        Row(children: [
          Expanded(
            ///구매한 이유
            child: post.reason.text
                .color(context.colorScheme.onPrimaryContainer)
                .make(),
          ),
        ]),
        const Height(10),
        const MySeparator(
          color: Colors.grey,
        ),
        const Height(10),

        //다짐
        Row(children: [
          '다짐'.text.bold.make(),
        ]),
        const Height(5),
        Row(children: [
          Expanded(
            ///다짐
            child: post.promise.text
                .color(context.colorScheme.onPrimaryContainer)
                .make(),
          ),
        ])
      ],
    );
  }
}
