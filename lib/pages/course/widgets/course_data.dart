// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../common/widgets/small_text.dart';

class CourseData extends StatelessWidget {
  final String level;
  final String time;
  const CourseData({
    super.key,
    required this.level,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.class_, size: 11),
            SmallText(text: ' $level'),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.access_time_rounded, size: 11),
            SmallText(text: ' $time'),
          ],
        ),
      ],
    );
  }
}
