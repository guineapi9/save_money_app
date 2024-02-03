import 'package:flutter/material.dart';

import '../theme/color/abs_theme_colors.dart';
import '../theme/custom_theme.dart';
import '../theme/custom_theme_holder.dart';

extension ContextExtension on BuildContext {

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  AbstractThemeColors get appColors => CustomThemeHolder.of(this).appColors;

  //TextTheme get textTheme => Theme.of(this).textTheme;

  double width(double widthSize) {
    return MediaQuery.of(this).size.width * widthSize;
  }

  double height(double heightSize) {
    return MediaQuery.of(this).size.height * heightSize;
  }

  double get deviceWidth {
    return MediaQuery.of(this).size.width;
  }

  double get deviceHeight {
    return MediaQuery.of(this).size.height;
  }

  //AbsThemeShadows get appShadows => CustomThemeHolder.of(this).appShadows;

  CustomTheme get themeType => CustomThemeHolder.of(this).theme;

  //테마 변경
  Function(CustomTheme) get changeTheme => CustomThemeHolder.of(this).changeTheme;

}
