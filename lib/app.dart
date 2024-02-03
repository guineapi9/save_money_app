import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nav/nav.dart';
import 'package:save_money_app/common/common.dart';
import 'package:save_money_app/screen/s_main.dart';
import 'package:save_money_app/splash/s_splash.dart';

import 'common/theme/custom_theme.dart';
import 'common/theme/custom_theme_app.dart';

class App extends StatefulWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App>  with Nav {
  // This widget is the root of your application.
  @override
  GlobalKey<NavigatorState> get navigatorKey => App.navigatorKey;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //routerConfig: _router, //Go_router 미사용
      //테마는 시스템을 따라가게 만들었다. 그래서 Listener를 삭제하였다.
      theme: context.themeType.themeData,
      //darkTheme: darkTheme,
      navigatorKey: navigatorKey, //go_router에서는 미사용
      title: 'Flutter Demo',
      home: const SplashScreen(),
    );
  }
}
