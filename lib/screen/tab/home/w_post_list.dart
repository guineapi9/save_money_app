import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_money_app/common/common.dart';
import 'package:save_money_app/data/memory/post_data_holder.dart';
import 'package:save_money_app/screen/tab/home/w_post_item.dart';

class PostList extends StatelessWidget with PostDataProvider {
  PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => postData.postList.isEmpty
          ? Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ['이 공간이 채워지지 않았으면 좋겠습니다.'.text.size(16).makeCentered()],
            ),
          )
          : Column(
              children:
                  postData.postList.map((post) => PostItem(post)).toList(),
            ),
    );
  }
}
