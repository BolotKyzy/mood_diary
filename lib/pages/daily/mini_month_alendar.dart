import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mood_diary/app_constants/app_colors.dart';

class MiniMonthView extends StatefulWidget {
  final int month;
  final int year;
  final DateTime selectedDate;
  final DateTime today;
  final bool isMonthCal;
  final Function(DateTime) onMonthTap;
  final Function(DateTime) onDayTap;

  MiniMonthView({
    required this.isMonthCal,
    required this.month,
    required this.year,
    required this.selectedDate,
    required this.today,
    required this.onMonthTap,
    required this.onDayTap,
  });

  @override
  State<MiniMonthView> createState() => _MiniMonthViewState();
}

class _MiniMonthViewState extends State<MiniMonthView> {
  DateTime selectedday = DateTime.now();
  @override
  Widget build(BuildContext context) {
    DateTime firstDayOfMonth = DateTime(widget.year, widget.month, 1);
    int daysInMonth = DateTime(widget.year, widget.month + 1, 0)
        .day; // Get the last day of the month
    String monthName =
        DateFormat.MMMM('ru').format(firstDayOfMonth); // Month name
    return GestureDetector(
      onTap: () {
        widget.onMonthTap(DateTime(widget.year, widget.month, 1));
      },
      child: Column(
        children: [
          Align(
            alignment: widget.isMonthCal
                ? Alignment.bottomLeft
                : Alignment.bottomCenter,
            child: Text(
              '${monthName[0].toUpperCase()}${monthName.substring(1)}', // Month name
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: AppColors.calendarColor),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7, // 7 days in a week
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            itemCount: daysInMonth,
            itemBuilder: (context, index) {
              DateTime day = DateTime(widget.year, widget.month, index + 1);
              bool isToday = isSameDay(day, widget.today);
              bool isSelected = isSameDay(day, widget.selectedDate);
              // bool isTapped ;

              return InkWell(
                onTap: () {
                  widget.onDayTap(day);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected || isToday
                        ? Color.fromARGB(64, 255, 135, 2)
                        : Colors.transparent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${day.day}',
                        style: TextStyle(
                          color: AppColors.calendarColor,
                          fontSize: widget.isMonthCal ? 18 : 10,
                        ),
                      ),
                      isToday
                          ? Container(
                              height: 5,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.orange),
                            )
                          : Container()
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  bool isSameDay(DateTime day1, DateTime day2) {
    return day1.year == day2.year &&
        day1.month == day2.month &&
        day1.day == day2.day;
  }
}
