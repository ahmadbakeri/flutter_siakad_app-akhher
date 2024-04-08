import 'package:flutter/material.dart';
import '../../../common/widgets/small_text.dart';

class LessonData extends StatelessWidget {
  final String author;
  final String time;
  final String field;
  const LessonData({
    super.key,
    required this.author,
    required this.time,
    required this.field,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            const Icon(Icons.person, size: 11),
            SmallText(text: ' $author'),
          ],
        ),
        const SizedBox(width: 10),
        Row(
          children: [
            const Icon(Icons.access_time_rounded, size: 11),
            SmallText(text: ' $time'),
          ],
        ),
        const SizedBox(width: 10),
        Row(
          children: [
            const Icon(Icons.category, size: 11),
            SmallText(text: ' $field'),
          ],
        ),
      ],
    );
  }
}
