import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:save_money_app/common/extension/context_extension.dart';
import 'package:save_money_app/data/memory/delete_button_holder.dart';
import 'package:save_money_app/data/memory/post_data_holder.dart';
import 'package:save_money_app/screen/tab_item.dart';
import 'package:velocity_x/velocity_x.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with PostDataProvider, DeleteButtonProvider {
  int _index = 0;
  static const duration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: context.colorScheme.background,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: "무지출 캘린더".text.size(20).bold.make(),
            actions: [
              // ///다크모드 변경 아이콘
              // IconButton(
              //   onPressed: () {
              //     ThemeUtil.toggleTheme(context);
              //   },
              //   icon: context.isDarkMode
              //       ? Icon(Icons.nightlight_round, color: context.appColors.redBlue)
              //       : Icon(Icons.wb_sunny, color: context.appColors.redBlue),
              // ),

              ///편집 아이콘
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: AnimatedCrossFade(
                  //활성화시에는 진한 색
                  firstChild: IconButton(
                      onPressed: () {
                        buttonData.toggleVisible();
                      },
                      icon:
                          Icon(Icons.delete, color: context.colorScheme.primary)),
                  //비활성화시에는 연한 색
                  secondChild: IconButton(
                      onPressed: () {
                        buttonData.toggleVisible();
                      },
                      icon: Icon(Icons.delete,
                          color: context.colorScheme.primaryContainer)),
                  crossFadeState: buttonData.isVisible.value
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: duration,
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
                  //데이터 추가
                  postData.addPost();
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
      ),
    );
  }
}
