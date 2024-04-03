import 'package:flutter/material.dart';

class SubjectData extends StatelessWidget {
  final String author;
  final String time;
  final String rating;
  final String category;
  const SubjectData({
    super.key,
    required this.author,
    required this.time,
    required this.rating,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.person),
            Text(' $author'),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.access_time_rounded),
            Text(' $time'),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.star),
            Text(' $rating'),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.category),
            Text(' $category'),
          ],
        ),
      ],
    );
  }
}
