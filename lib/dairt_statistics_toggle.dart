import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mood_diary/app_constants/app_colors.dart';

class AnimatedToggle extends StatefulWidget {
  final List<String> values;
  final List<String> icons;

  final ValueChanged onToggleCallback;
  final Color backgroundColor;
  final Color buttonColor;
  final Color textColor;

  AnimatedToggle({
    required this.values,
    required this.icons,
    required this.onToggleCallback,
    this.backgroundColor = AppColors.lightGrey,
    this.buttonColor = AppColors.orange,
    this.textColor = Colors.white,
  });
  @override
  _AnimatedToggleState createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
  bool initialPosition = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      height: 30,
      margin: EdgeInsets.all(20),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              initialPosition = !initialPosition;
              var index = 0;
              if (!initialPosition) {
                index = 1;
              }
              widget.onToggleCallback(index);
              setState(() {});
            },
            child: Container(
              width: 288,
              height: 30,
              decoration: ShapeDecoration(
                color: widget.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.width * 0.1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  widget.values.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(children: [
                      SvgPicture.asset(
                        width: 12,
                        height: 12,
                        color: AppColors.grey,
                        'assets/icons/${widget.icons[index]}',
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.values[index],
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.decelerate,
            alignment:
                initialPosition ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: 170,
              height: Get.width * 0.13,
              decoration: ShapeDecoration(
                color: widget.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.width * 0.1),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      width: 12,
                      height: 12,
                      color: Colors.white,
                      initialPosition
                          ? 'assets/icons/${widget.icons[0]}'
                          : 'assets/icons/${widget.icons[1]}',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      initialPosition ? widget.values[0] : widget.values[1],
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 12,
                        color: widget.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
