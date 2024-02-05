import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nav/nav.dart';
import 'package:save_money_app/common/common.dart';
import 'package:save_money_app/data/memory/post_data_holder.dart';
import 'package:save_money_app/splash/s_splash.dart';

class App extends StatefulWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App>  with Nav, WidgetsBindingObserver {
  // This widget is the root of your application.
  @override
  GlobalKey<NavigatorState> get navigatorKey => App.navigatorKey;

  @override
  void initState() {
    super.initState();
    ///메서드로 클래스의 인스턴스를 등록
    Get.put(PostDataHolder());
    WidgetsBinding.instance.addObserver(this);
  }


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
