import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CalendarBlock extends StatelessWidget {
  final Function() onTap;

  const CalendarBlock({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              DateFormat('d MMMM HH:mm', 'ru').format(DateTime.now()),
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffBCBCBF)),
            ),
          ),
        ),
        InkWell(
            onTap: onTap,
            child: SvgPicture.asset('assets/icons/calendar_icon.svg'))
      ],
    );
  }
}
