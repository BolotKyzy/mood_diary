import 'package:flutter/material.dart';
import 'package:mood_diary/app_constants/app_colors.dart';

class SubTitleWidget extends StatelessWidget {
  SubTitleWidget({
    required this.title,
    super.key,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: AppColors.subTitleC),
        ),
      ),
    );
  }
}
