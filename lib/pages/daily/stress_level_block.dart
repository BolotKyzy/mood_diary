import 'package:flutter/material.dart';
import 'package:mood_diary/app_constants/widgets/subtitle.dart';
import 'package:mood_diary/pages/daily/custom_slider.dart';

class StressLevelBlock extends StatelessWidget {
  const StressLevelBlock({super.key, required this.value, this.onChanged});

  final double value;
  final Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubTitleWidget(title: "Уровень стресса"),
        CustomSlider(
          value: value,
          onChanged: onChanged,
          firstText: 'Низкий',
          lastText: 'Высокий',
        ),
      ],
    );
  }
}
