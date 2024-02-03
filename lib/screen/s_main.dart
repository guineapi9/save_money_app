import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:save_money_app/common/extension/context_extension.dart';
import 'package:save_money_app/screen/d_write_post.dart';
import 'package:save_money_app/screen/tab_item.dart';
import 'package:velocity_x/velocity_x.dart';

import '../common/theme/custom_theme_holder.dart';
import '../common/theme/theme_util.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: "아니 이거 왜 산거야".text.size(20).bold.make(),
          actions: [

            ///다크모드 변경 아이콘
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () {
                  ThemeUtil.toggleTheme(context);
                },
                icon: context.isDarkMode
                    ? Icon(Icons.nightlight_round, color: Colors.blue[300]!)
                    : Icon(Icons.wb_sunny, color: Colors.red[300]!),
              ),
            ),
          ]),
      body: _index < tabItems.length ? tabItems[_index].page : Container(),
      floatingActionButton: _index == 0
          ? FloatingActionButton(
              backgroundColor: context.colorScheme.primary,
              foregroundColor: context.colorScheme.onPrimary,
              shape: const CircleBorder(),
              elevation: 5,
              onPressed: () {
                WritePostDialog().show();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.edit),
            )
          : null,
      bottomNavigationBar: NavigationBar(
        destinations: tabItems
            .map((tabItem) => NavigationDestination(
                icon: Icon(tabItem.icon), label: tabItem.label))
            .toList(),
        selectedIndex: _index,
        onDestinationSelected: (newIndex) => setState(() => _index = newIndex),
        indicatorColor: context.colorScheme.primaryContainer,
        surfaceTintColor: Colors.grey,
        animationDuration: const Duration(milliseconds: 1000),
      ),
    );
  }
}
