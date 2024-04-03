import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  double size;
  Color color;
  BigText({
    super.key,
    required this.text,
    this.size = 23,
    this.color = Colors.black,
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
