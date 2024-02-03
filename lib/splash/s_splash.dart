import 'package:flutter/material.dart';
import 'package:save_money_app/common/common.dart';
import 'package:save_money_app/common/theme/app_colors.dart';

import '../screen/s_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    delay((){
      Nav.clearAllAndPush(const MainScreen());
    },const Duration(milliseconds: 1000));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.brightGrey,
        ),
        Center(
              child: Image.asset(
                "assets/image/purplemisspiggy.jpg",
                fit: BoxFit.fill,
              )),
      ],
    );
  }
}
