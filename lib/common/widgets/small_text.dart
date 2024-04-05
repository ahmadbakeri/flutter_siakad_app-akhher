import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  final String text;
  double size;
  Color color;
  TextAlign textAlign;
  SmallText({
    super.key,
    required this.text,
    this.size = 11,
    this.color = Colors.black,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}
