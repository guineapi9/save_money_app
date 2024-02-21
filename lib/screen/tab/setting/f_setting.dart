import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:save_money_app/common/common.dart';
import 'package:save_money_app/screen/tab/setting/d_number.dart';
import 'package:save_money_app/screen/tab/setting/w_setting_button.dart';
import 'package:save_money_app/screen/tab/setting/w_setting_item.dart';

import '../../../common/preference/prefs.dart';
import '../../../common/theme/theme_util.dart';
import '../../../common/widget/animated_height_collapse.dart';
import '../../../common/widget/w_expanded_button.dart';

class SettingFragment extends StatefulWidget {
  const SettingFragment({super.key});

  @override
  State<SettingFragment> createState() => _SettingFragmentState();
}

class _SettingFragmentState extends State<SettingFragment> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        children: [
          ///1번째 : 기준금액 설정
          Obx(
          () => SettingButton("목표금액 설정 : ", Prefs.number.get().toWon(),onTap: () async {
              final number = await NumberDialog().show();
              if (number != null) {
                Prefs.number.set(number);
              }
            }),
          ),
          ///2번째 : 다크모드
          RoundedContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    "다크 모드 설정 : ".text.bold.make(),
                    "현재 상태 ".text.make(),
                    context.isDarkMode
                        ? Icon(Icons.nightlight_round,
                            color: context.appColors.redBlue)
                        : Icon(Icons.wb_sunny,
                            color: context.appColors.redBlue),
                  ],
                ),
                CupertinoSwitch(
                  value: context.isDarkMode,
                  onChanged: (bool value) {
                    ThemeUtil.toggleTheme(context);
                  },
                  activeColor: Colors.blue[300]!,
                  trackColor: Colors.red[200]!,
                )
              ],
            ),
          ).pOnly(bottom: 10),
        ],
      ),
    );
  }
}
