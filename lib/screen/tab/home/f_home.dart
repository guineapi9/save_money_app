import 'package:flutter/material.dart';
import 'package:save_money_app/screen/tab/home/w_post_list.dart';

Widget coloredContainer(Color color) {
  return Container(
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
    width: 350,
    height: 100,
    child: Center(
      child: Row(
        children: [
          Ink(
            decoration: const BoxDecoration(color: Colors.red),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.android,
                  color: Colors.green,
                )),
          ),
          Text(
            "안녕하세요",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    ),
    //color: color,
  );
}

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PostList(),
      ],
    );
  }
}
