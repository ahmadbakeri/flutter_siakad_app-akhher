import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final String text;
  double size;
  Color color;
  TextOverflow overFlow;
  int maxLines;
  BigText({
    super.key,
    required this.text,
    this.size = 16,
    this.color = Colors.black,
    this.overFlow = TextOverflow.ellipsis,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
