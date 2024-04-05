import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final String text;
  double size;
  Color color;
  BigText({
    super.key,
    required this.text,
    this.size = 16,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}