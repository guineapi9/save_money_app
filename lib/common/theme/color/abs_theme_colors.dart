import 'package:flutter/material.dart';
export 'dart:ui' hide TextDirection;

typedef ColorProvider = Color Function();

abstract class AbstractThemeColors {
  const AbstractThemeColors();

  Color get text => Colors.grey.shade800;

  Color get text2 => Colors.grey.shade600;

  Color get seedColor => const Color(0xff26ff8c);

  ///라이트모드 => 레드, 다크모드 => 블루
  ///DeleteButton, 다크모드 변경, 기타 색상 강조시 사용
  Color get redBlue => Colors.red.shade300;

  // Color get veryBrightGrey => AppColors.brightGrey;
  //
  // Color get drawerBg => const Color.fromARGB(255, 255, 255, 255);
  //
  // Color get scrollableItem => const Color.fromARGB(255, 57, 57, 57);
  //
  // Color get iconButton => const Color.fromARGB(255, 0, 0, 0);
  //
  // Color get iconButtonInactivate => const Color.fromARGB(255, 162, 162, 162);
  //
  // Color get inActivate => const Color.fromARGB(255, 200, 207, 220);
  //
  // Color get activate => const Color.fromARGB(255, 63, 72, 95);
  //
  // Color get badgeBg => AppColors.blueGreen;
  //
  // Color get textBadgeText => Colors.white;
  //
  // Color get badgeBorder => Colors.transparent;
  //
  // Color get divider => const Color.fromARGB(255, 228, 228, 228);
  //
  // Color get hintText => AppColors.middleGrey;
  //
  // Color get focusedBorder => AppColors.darkGrey;
  //
  // Color get confirmText => AppColors.blue;
  //
  // Color get drawerText => text;
  //
  // Color get snackbarBgColor => AppColors.mediumBlue;
  //
  // Color get blueButtonBackground => AppColors.darkBlue;
  //
  // Color get floatingActionLayer => const Color.fromARGB(255, 37, 37, 37);
  //
  // Color get lessImportant => const Color.fromARGB(255, 117, 117, 117);
  //
  // Color get unreadColor => const Color.fromARGB(255, 57, 57, 57);
}
