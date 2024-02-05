import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:save_money_app/app.dart';
import 'common/preference/app_preferences.dart';
import 'common/preference/prefs.dart';
import 'common/theme/custom_theme.dart';
import 'common/theme/custom_theme_app.dart';
import 'data/local/local_db.dart';

void main() async {
  //Flutter 바인딩을 초기화하고 애플리케이션을 실행할 준비를 마치게 하는 역할을 한다.
  //비동기 작업이 수행되는 경우, 앱이 정확한 순서로 초기화되어야 하는 경우에 이 메서드를 사용합니다.
  //final bindings = WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: bindings);

  await initializeDateFormatting('ko_KR', null);
  await LocalDB.init();

  //SavedTheme 설정을 기다리는 App Preferenece.
  await AppPreferences.init();

  //save theme
  CustomThemeApp.init(saveThemeFunction: (theme) {
    Prefs.appTheme.set(theme); // 또는 Prefs.appTheme(theme) 이렇게 저장도 가능
  });

  runApp(CustomThemeApp(
      defaultTheme: CustomTheme.light,
      savedTheme: Prefs.appTheme.get(),
      child: const App()));
}
