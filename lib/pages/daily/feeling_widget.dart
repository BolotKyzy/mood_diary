import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mood_diary/app_constants/app_colors.dart';
import 'package:mood_diary/app_constants/constants.dart';
import 'package:mood_diary/app_constants/widgets/subtitle.dart';

class FeelingBlock extends StatefulWidget {
  final List<String> choosedFillings;
  final Function(String) onTap;

  const FeelingBlock({
    required this.choosedFillings,
    required this.onTap,
    super.key,
  });

  @override
  State<FeelingBlock> createState() => _FeelingBlockState();
}

class _FeelingBlockState extends State<FeelingBlock> {
  List<String> relatedFeelings = [];
  List<bool> isSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  // List<String> choosedFillings = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubTitleWidget(title: 'Что чувствуешь?'),
        CarouselSlider(
          options: CarouselOptions(
            height: 118.0,
            viewportFraction: 0.28,
          ),
          items: [0, 1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  onTap: () {
                    for (int j = 0; j < 6; j++) {
                      if (i == j) {
                        isSelected[j] = true;
                      } else {
                        isSelected[j] = false;
                      }
                    }
                    setState(() {
                      relatedFeelings = feelingsMap[feelings[i]] ?? [];
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 2,
                            color: isSelected[i]
                                ? AppColors.orange
                                : Colors.white),
                        borderRadius: BorderRadius.circular(76),
                        boxShadow: AppConstants.shadow,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            Image.asset('assets/img/${feelingsIcon[i]}.jpg'),
                            Text(
                              feelings[i],
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 11.0, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 20,
        ),
        feelingsMap.isNotEmpty
            ? Container(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  runSpacing: 8,
                  children: relatedFeelings
                      .map((feeling) => Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3.0, horizontal: 8),
                            child: InkWell(
                              onTap: () {
                                widget.onTap(feeling);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3.0, horizontal: 8),
                                decoration: BoxDecoration(
                                    color:
                                        widget.choosedFillings.contains(feeling)
                                            ? AppColors.orange
                                            : Colors.white,
                                    borderRadius: BorderRadius.circular(3),
                                    boxShadow: AppConstants.shadow),
                                child: Text(
                                  feeling,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        widget.choosedFillings.contains(feeling)
                                            ? Colors.white
                                            : Color(0xff4C4C69),
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              )
            : Container(),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
