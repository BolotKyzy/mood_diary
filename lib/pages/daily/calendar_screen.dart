import 'package:flutter/material.dart';
import 'package:mood_diary/app_constants/app_colors.dart';
import 'package:mood_diary/pages/daily/mini_month_alendar.dart';

class CalendarScreen extends StatefulWidget {
  final Function() exitFunc;
  const CalendarScreen({super.key, required this.exitFunc});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  bool isScrolled = false;
  DateTime? _selectedDay;

  bool _isYearView = false;
  final List<int> _months = List.generate(12, (index) => index + 9);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: widget.exitFunc,
                child: const Icon(
                  Icons.clear,
                  color: AppColors.grey,
                ),
              ),
              _buildTodayButton(),
            ],
          ),
          _buildCalendarHeader(),
          _isYearView
              ? _buildYearView()
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: _months
                        .map((month) => Container(
                              height: 400, // Высота контейнера для календаря
                              width: double
                                  .infinity, // Занимает всю доступную ширину
                              child: _buildMonthView(month),
                            ))
                        .toList(),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildYearView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 800,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 3 months per row
            crossAxisSpacing: 25,
            mainAxisSpacing: 4,
          ),
          itemCount: 12,
          itemBuilder: (context, index) {
            int month = index + 1;
            return MiniMonthView(
              isMonthCal: false,
              month: month,
              year: _focusedDay.year,
              selectedDate: _selectedDay ??
                  DateTime
                      .now(), // Use current date or any other fallback value
              today: DateTime.now(),
              onDayTap: (date) {
                setState(() {
                  _selectedDay = date;
                  _focusedDay = date;
                });
              },
              onMonthTap: (date) {
                setState(() {
                  _selectedDay = date;
                  _focusedDay = date;
                  _isYearView = false; // Switch back to month view
                });
              },
            );
          },
        ),
      ),
    );
  }

// Monthly view using TableCalendar
  Widget _buildMonthView(int month) {
    return MiniMonthView(
      isMonthCal: true,
      month: month,
      year: _focusedDay.year,
      selectedDate: _selectedDay ??
          DateTime.now(), // Use current date or any other fallback value
      today: DateTime.now(),
      onDayTap: (date) {
        setState(() {
          _selectedDay = date;
          _focusedDay = date;
        });
      },

      onMonthTap: (date) {
        setState(() {
          _selectedDay = date;
          _focusedDay = date;
          _isYearView = false; // Switch back to month view
        });
      },
    );
  }

// Button to reset to today's date
  Widget _buildTodayButton() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'Сегодня',
        style: TextStyle(
            color: AppColors.grey, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

// Header with month/year toggle
  Widget _buildCalendarHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isYearView = !_isYearView;
          });
        },
        child: Text(
          '${_focusedDay.year}',
          style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: AppColors.calendarColor),
        ),
      ),
    );
  }
}
