import 'package:flutter/material.dart';
import 'package:save_money_app/screen/tab/calendar/f_calendar.dart';
import 'package:save_money_app/screen/tab/home/f_home.dart';
import 'package:save_money_app/screen/tab/setting/f_setting.dart';

class TabItem {
  final IconData icon;
  final String label;
  final Widget page;

  const TabItem(this.icon, this.label, this.page);
}

final List<TabItem> tabItems = [
  const TabItem(Icons.home, 'home', HomeFragment()),
  const TabItem(Icons.calendar_month, 'calendar', CalendarFragment()),
  const TabItem(Icons.settings, 'setting', SettingFragment()),
  // Add more tab items as needed
];