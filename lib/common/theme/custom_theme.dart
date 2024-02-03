import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'color/abs_theme_colors.dart';
import 'color/dark_app_colors.dart';
import 'color/light_app_colors.dart';

enum CustomTheme {
  dark(
    DarkAppColors(),
    name: "다크",
    color: AppColors.veryDarkGrey,
  ),
  light(
    LightAppColors(),
    name: "라이트",
    color: AppColors.brightGrey,
  );

  const CustomTheme(
    this.appColors, //this.appShadows,
    {
    required this.name,
    required this.color,
  });

  final AbstractThemeColors appColors;
  final String name;
  final Color color;

  ThemeData get themeData {
    switch (this) {
      case CustomTheme.dark:
        return darkTheme;
      case CustomTheme.light:
        return lightTheme;
    }
  }
}

ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    textTheme: GoogleFonts.nanumGothicTextTheme(
      ThemeData(brightness: Brightness.light).textTheme,
    ),
    //colorScheme: ColorScheme.fromSeed(seedColor: CustomTheme.light.appColors.seedColor)
    colorScheme: ColorScheme.fromSeed(
      ///사용 하는 색깔
      background: Colors.grey[100]!, //배경색
      surface: Colors.grey[50]!, //컨테이너 배경색

      primary: Colors.grey[700]!, //첫번째 진한 컬러
      primaryContainer: Colors.grey[400]!, //첫번째 옅은컬러

      onPrimary: Colors.grey[200]!, //첫번째 진한 컬러의 반대색 //텍스트에는 미사용
      onPrimaryContainer: Colors.grey[800]!, //첫번째 옅은 컬러의 반대색 //텍스트에는 미사용

      ///사용하지 않는 색깔
      seedColor: Colors.deepPurple, //씨드컬러 //씨드컬러는 흑백이 안되는듯
      secondary: Colors.blueAccent,
    )
);

//const darkColorSeed = Color(0xbcd5ff7e);
ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.veryDarkGrey,
    textTheme: GoogleFonts.nanumGothicTextTheme(
      ThemeData(brightness: Brightness.dark).textTheme,
    ),
    // colorScheme: ColorScheme.fromSeed(
    //     seedColor: CustomTheme.dark.appColors.seedColor, brightness: Brightness.dark)
  colorScheme: ColorScheme.fromSeed(
    /// 사용하는 색상
    background: Colors.black, // 배경색
    surface: Colors.grey[900]!, // 컨테이너 배경색

    primary: Colors.grey[300]!, // 첫번째 진한 컬러
    primaryContainer: Colors.grey[600]!, // 첫번째 연한 컬러

    onPrimary: Colors.grey[800]!, // 첫번째 진한 컬러의 반대색 //텍스트에는 미사용
    onPrimaryContainer: Colors.grey[200]!, // 첫번째 흰 컨테이너의 반대색 //텍스트에는 미사용

    /// 사용하지 않는 색상
    seedColor: Colors.deepPurple, // 씨드컬러 (씨드컬러는 흑백이 안되는듯)
    secondary: Colors.blueAccent,

    ///밝기 설정(이것을 설정하지 않으면 에러 발생)
    brightness: Brightness.dark
  ),
);
