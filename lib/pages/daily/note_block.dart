import 'package:flutter/material.dart';
import 'package:mood_diary/app_constants/app_colors.dart';
import 'package:mood_diary/app_constants/constants.dart';
import 'package:mood_diary/app_constants/widgets/subtitle.dart';

class NotesBlock extends StatelessWidget {
  const NotesBlock({super.key, this.onChanged});

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubTitleWidget(title: 'Заметки'),
        Container(
          height: 90,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: AppConstants.shadow,
            borderRadius: BorderRadius.circular(13),
          ),
          child: TextField(
            onChanged: onChanged,
            decoration: const InputDecoration(
              hintText: 'Введите заметку',
              hintStyle: TextStyle(fontSize: 14, color: AppColors.grey),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }
}
