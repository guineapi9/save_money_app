import 'package:flutter/material.dart';
import 'package:save_money_app/screen/tab/home/w_post_list.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PostList(),
      ],
    );
  }
}
