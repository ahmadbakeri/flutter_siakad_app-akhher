import 'package:flutter/material.dart';

import '../../../common/widgets/small_text.dart';

class SubjectData extends StatelessWidget {
  final String author;
  final String time;
  final String category;
  const SubjectData({
    super.key,
    required this.author,
    required this.time,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.person, size: 11),
            SmallText(text: ' $author'),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.access_time_rounded, size: 11),
            SmallText(text: ' $time'),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.category, size: 11),
            SmallText(text: ' $category'),
          ],
        ),
      ],
    );
  }
}
