// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  final String text;
  double size;
  Color color;
  TextAlign textAlign;
  TextOverflow overFlow;
  int maxLines;
  SmallText({
    super.key,
    required this.text,
    this.size = 11,
    this.color = Colors.black,
    this.textAlign = TextAlign.left,
    this.overFlow = TextOverflow.ellipsis,
    this.maxLines = 2,
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
      ),
    );
  }
}
