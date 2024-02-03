import 'package:flutter/material.dart';
import 'package:save_money_app/common/common.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarFragment extends StatelessWidget {
  const CalendarFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarBuilders: CalendarBuilders(
        singleMarkerBuilder: (context, day, events) {
          // 글이 작성된 날짜인 경우 빨간 동그라미 표시
          final isPostDate = isSameDay(day, DateTime(2024, 1, 10)); // 예시 날짜
          return isPostDate
              ? Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                )
              : null;
        },
      ),
      focusedDay: DateTime.now(),
      firstDay: DateTime.now().subtract(const Duration(days: 365)),
      lastDay: DateTime.now().add(const Duration(days: 100)),
      daysOfWeekHeight: 50,
      locale: 'ko_KR',
      onDaySelected: (selectedDay, focusedDay) {
        final snackBar = SnackBar(
          content: Text('Selected Day: ${selectedDay.toLocal()}'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    ).p(20);
  }
}
