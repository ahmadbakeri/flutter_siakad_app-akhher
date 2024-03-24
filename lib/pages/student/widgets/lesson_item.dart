import 'package:flutter/material.dart';


class LessonItem extends StatelessWidget {
  final String lessonTitle;
  final int length;
  final String title;
  final String subtitle;

  const LessonItem({
    Key? key,
    required this.lessonTitle,
    required this.length,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(lessonTitle), // Display the subject title in the app bar
      ),
      body: ListView.builder(
        itemCount: length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            // You can display other lesson details here
          );
        },
      ),
    );
  }
}
