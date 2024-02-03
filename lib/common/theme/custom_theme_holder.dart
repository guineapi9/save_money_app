
import 'package:flutter/material.dart';
import 'color/abs_theme_colors.dart';
import 'custom_theme.dart';

class CustomThemeHolder extends InheritedWidget {
  final AbstractThemeColors appColors;
  //final AbsThemeShadows appShadows;
  final CustomTheme theme;
  final Function(CustomTheme) changeTheme;

  CustomThemeHolder({
    required Widget child,
    required this.theme,
    required this.changeTheme,
    Key? key,
  })  : appColors = theme.appColors,
        //appShadows = theme.appShadows,
        super(key: key, child: child);

  //old와 current가 다르면 need가 true.
  @override
  bool updateShouldNotify(CustomThemeHolder oldWidget) {
    final old = oldWidget.theme;
    final current = theme;
    final need = old != current;
    return need;
  }

  //부모의 데이터에 접근할 수 있도록 함
  //이 메서드는 위젯 트리를 거슬러 올라가면서 해당 타입의 InheritedWidget을 찾게 됩니다.
  //https://velog.io/@tykan/Flutter-%ED%95%9C-%EC%A1%B0%EA%B0%81-%EB%B6%80%EB%AA%A8-%EB%8D%B0%EC%9D%B4%ED%84%B0-%EC%A0%91%EA%B7%BC
  static CustomThemeHolder of(BuildContext context) {
    CustomThemeHolder inherited =
        (context.dependOnInheritedWidgetOfExactType<CustomThemeHolder>())!;
    return inherited;
  }
}
