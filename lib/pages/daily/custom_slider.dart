import 'package:flutter/material.dart';
import 'package:mood_diary/app_constants/app_colors.dart';
import 'package:mood_diary/app_constants/constants.dart';
import 'package:mood_diary/app_constants/widgets/custom_track_shape.dart';
import 'package:mood_diary/app_constants/widgets/sliders_small_text.dart';

class CustomSlider extends StatelessWidget {
  final double value;
  final Function(double)? onChanged;
  final bool linearStep;
  final String firstText;
  final String lastText;

  CustomSlider({
    required this.value,
    required this.firstText,
    required this.lastText,
    required this.onChanged,
    this.linearStep = true,
  });

  @override
  Widget build(BuildContext context) {
    final allocatedHeight = MediaQuery.of(context).size.height;
    final allocatedWidth = MediaQuery.of(context).size.width;
    const divisions = 6;
    final double tickHeight =
        allocatedHeight * 0.025 < 20 ? 20 : allocatedHeight * 0.025;
    final labelOffset = allocatedWidth / divisions / 2;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: AppConstants.shadow,
      ),
      child: Column(
        children: [
          Row(
            children: List.generate(
              divisions,
              (index) => Expanded(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: tickHeight,
                      child: VerticalDivider(
                        indent: 10,
                        thickness: 2,
                        color: (index / (divisions - 1)) * 100 == value
                            ? AppColors.orange
                            : Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: labelOffset),
            child: SliderTheme(
              data: SliderThemeData(
                trackHeight: 6,
                activeTickMarkColor: AppColors.orange,
                inactiveTickMarkColor: AppColors.grey_slider,
                activeTrackColor: AppColors.orange,
                inactiveTrackColor: AppColors.grey_slider,
                thumbColor: AppColors.orange,
                overlayColor: Colors.white,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 5.0,
                ),
                trackShape: CustomTrackShape(),
              ),
              child: Slider(
                value: value,
                min: 0,
                max: 100,
                divisions: 100,
                onChanged: onChanged,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SlidersSmalText(text: firstText),
                SlidersSmalText(text: lastText),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
