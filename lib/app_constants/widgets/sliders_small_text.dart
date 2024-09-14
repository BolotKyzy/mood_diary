import 'package:flutter/material.dart';

class SlidersSmalText extends StatelessWidget {
  const SlidersSmalText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
    );
  }
}
