import 'package:flutter/material.dart';

import '../../../common/common.dart';

class PostItemDetail extends StatelessWidget {
  const PostItemDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Height(10),
        const MySeparator(color: Colors.grey,),
        const Height(10),
        Row(children: [
          '구매한 이유'.text.size(16).bold.make(),
        ]),
        const Height(5),
        Row(children: [
          Expanded(
            child: '아이패드병 걸려서'
                .text
                .color(context.colorScheme.onPrimaryContainer)
                .make(),
          ),
        ]),
        const Height(10),
        const MySeparator(color: Colors.grey,),
        const Height(10),

        // 대체품
        Row(children: [
          '대체품'.text.bold.make(),
        ]),
        const Height(5),
        Row(children: [
          Expanded(
            child: '없는것 같은데'
                .text
                .color(context.colorScheme.onPrimaryContainer)
                .make(),
          ),
        ]),
        const Height(10),
        const MySeparator(color: Colors.grey,),
        const Height(10),

        //다짐
        Row(children: [
          '다짐'.text.bold.make(),
        ]),
        const Height(5),
        Row(children: [
          Expanded(
            child: '다시는 안사겠습니다 ㅠㅠ'
                .text
                .color(context.colorScheme.onPrimaryContainer)
                .make(),
          ),
        ])
      ],
    );
  }
}
