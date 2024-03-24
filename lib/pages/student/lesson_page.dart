import 'package:flutter/material.dart';

import '../../data/models/response/subject_response_model.dart';
import 'widgets/lesson_item.dart';

class LessonPage extends StatelessWidget {
  final Subject subject; // Assuming Subject is your data model
  // Add other necessary fields here

  const LessonPage({Key? key, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract lesson data from the subject
    final lessons = subject.lessons;

    return Scaffold(
      appBar: AppBar(
        title: Text(subject.title), // Display the subject title in the app bar
      ),
      body: ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(lessons[index].title),
                subtitle: Text(lessons[index].description),
                // You can display other lesson details here
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('ENTER'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LessonItem(
                              lessonTitle: lessons[index].title,
                              length: lessons.length,
                              title: lessons[index].youtubeLink,
                              subtitle: lessons[index].description,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
