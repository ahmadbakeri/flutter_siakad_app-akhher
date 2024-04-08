import 'package:flutter/material.dart';
import '../../../common/widgets/small_text.dart';

// ignore: must_be_immutable
class SubjectData extends StatelessWidget {
  final String author;
  final String time;
  double width;
  SubjectData({
    super.key,
    required this.author,
    required this.time,
    this.width = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.person, size: 11),
            SizedBox(
                width: width,
                child: SmallText(
                  text: ' $author',
                  maxLines: 1,
                )),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.access_time_rounded, size: 11),
            SmallText(text: ' $time min'),
          ],
        ),
      ],
    );
  }
}
