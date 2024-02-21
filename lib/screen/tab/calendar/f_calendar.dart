import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_money_app/common/common.dart';
import 'package:save_money_app/data/memory/delete_button_holder.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../common/preference/prefs.dart';
import '../../../data/memory/post_data_holder.dart';
import 'd_post_item_detail.dart';

class CalendarFragment extends StatefulWidget {
  const CalendarFragment({super.key});

  @override
  State<CalendarFragment> createState() => _CalendarFragmentState();
}

class _CalendarFragmentState extends State<CalendarFragment>
    with PostDataProvider, DeleteButtonProvider {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  final duration = const Duration(milliseconds: 300);

  //int sumPrice = 0;

  @override
  void initState() {
    //sumPrice = postData.sumPriceForMonth(_focusedDay);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle commonStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: context.appColors.text,
    );

    return Obx(
      () {
        final isVisible = buttonData.isVisible.value;
        final sumPrice = postData.sumForMonth(_focusedDay);
        final notNecessarySumPrice =
            postData.notNecessarySumForMonth(_focusedDay);
        return Column(
          children: [
            //캘린더 뒤에 배경색을 만들기 위해 일부러 컨테이너 지정
            Container(
              color: context.colorScheme.background,
              child: TableCalendar(
                ///헤더 스타일
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                  headerPadding: EdgeInsets.zero,
                ),

                ///요일 스타일
                daysOfWeekStyle: DaysOfWeekStyle(
                    //주말에 빨간색
                    weekendStyle: TextStyle(color: Colors.red.shade300)),

                ///캘린더 스타일
                calendarStyle: CalendarStyle(

                    ///마커 스타일
                    markerDecoration: BoxDecoration(
                  //다크모드에서 마커가 흰 색으로 변할 수 있도록 설정
                  color: context.colorScheme.primary,
                  shape: BoxShape.circle,
                )),

                firstDay:
                    DateTime.now().subtract(const Duration(days: 365 * 3)),
                lastDay: DateTime.now().add(const Duration(days: 100)),
                focusedDay: _focusedDay,
                daysOfWeekHeight: 50,

                ///이벤트
                eventLoader: postData.getEventsForDay,

                ///언어 설정
                locale: 'ko_KR',

                ///달력을 선택했을 때 표시
                //bool => 달력 한바뀌를 돌면서 이 날짜가 맞느냐? 물어본다, 그리고 true 반환.
                selectedDayPredicate: (day) {
                  final isSame = isSameDay(_selectedDay, day);
                  return isSame;
                },

                ///특정 일자를 선택
                //다른 작업보다 우선적으로 selectedDay가 바뀌고, 그 뒤에 순회 작업을 하는듯.
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                  setState(() {
                    //sumPrice = postData.sumPriceForMonth(_focusedDay);
                  });
                },
              ).pSymmetric(h: 20),
            ),
            const Height(8),

            ///Total 금액 컨테이너
            RoundedContainer(
              child: Column(
                children: [
                  ///금액 한도
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '월 지출 한도 : ',
                          style: commonStyle.copyWith(fontSize: 18),
                        ),
                        TextSpan(
                          text: Prefs.number.get().toWon(),
                          style: commonStyle.copyWith(
                              color: context.appColors.redBlue,
                              fontSize: 18), // 색상만 변경
                        ),
                      ],
                    ),
                  ),
                  const Height(8),
                  MySeparator(
                    color: context.colorScheme.primary,
                  ),
                  const Height(8),

                  ///금액 안내
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${_focusedDay.month}월에 총 ',
                          style: commonStyle,
                        ),
                        TextSpan(
                          text: sumPrice.toWon(),
                          style: commonStyle.copyWith(
                              color: context.appColors.redBlue), // 색상만 변경
                        ),
                        TextSpan(text: '을 사용하였고,', style: commonStyle),
                      ],
                    ),
                  ),
                  const Height(8),

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: '안써도되는 ', style: commonStyle),
                        TextSpan(
                          text: notNecessarySumPrice.toWon(),
                          style: commonStyle.copyWith(
                              color: context.appColors.redBlue), // 색상만 변경
                        ),
                        TextSpan(text: '이 사라졌습니다.', style: commonStyle),
                      ],
                    ),
                  ),
                ],
              ),
            ).pOnly(left: 20, right: 20, bottom: 10),
            // MySeparator(
            //   color: context.colorScheme.primary,
            // ),
            Expanded(
              child: ListView.builder(
                //itemCount : _getEventsForDay는 날짜별로 분리된 List, 이 중 [_selectedDay!]에서 원하는 날짜를 선택한다.
                //_selectedDay!는 초기에도 값을 지정하였으므로, null일 가능성이 없다.
                itemCount: postData.getEventsForDay(_selectedDay).length,
                itemBuilder: (context, index) {
                  ///현재 선택한 post
                  final currentPost =
                      postData.getEventsForDay(_selectedDay)[index];
                  return InkWell(
                    onTap: () {
                      PostItemDetailDialog(currentPost).show();
                    },
                    child: Column(
                      children: [
                        ListTile(
                            tileColor: context.colorScheme.surface,
                            textColor: context.appColors.text,
                            title: currentPost.product.text.bold.make(),
                            subtitle: currentPost.price.toWon().text.make(),
                            trailing:

                                ///PostItem에 있는것과 동일한 삭제 버튼
                                AnimatedCrossFade(
                                    duration: duration,
                                    firstChild: GestureDetector(
                                      onTap: () {
                                        postData.removePost(currentPost);
                                      },
                                      child: Icon(Icons.remove_circle,
                                          color: context.appColors.redBlue),
                                    ),
                                    secondChild: Icon(Icons.circle_rounded,
                                        color: context.colorScheme.background),
                                    crossFadeState: isVisible
                                        ? CrossFadeState.showFirst
                                        : CrossFadeState.showSecond)),
                      ],
                    ),
                  ).pSymmetric(v: 10, h: 30);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
