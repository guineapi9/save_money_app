import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_money_app/common/common.dart';
import 'package:save_money_app/data/memory/post_data_holder.dart';
import 'package:save_money_app/screen/tab/home/w_post_item.dart';

class PostList extends StatelessWidget with PostDataProvider{
  PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Obx(() =>
    postData.postList.isEmpty
        ? '작성해보세요.'.text.size(20).makeCentered()
        :
    Column(
      // children: [
      //   PostItem(),
      //   PostItem(),
      //   PostItem(),
      // ],
      children: postData.postList.map((post) => PostItem(post)).toList(),
    ),
    );
  }
}
