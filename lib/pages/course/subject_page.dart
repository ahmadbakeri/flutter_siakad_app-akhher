// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../data/models/response/course_response_model.dart';
import 'lesson_page.dart';

class SubjectPage extends StatelessWidget {
  final Course course;
  const SubjectPage({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subjects = course.subjects;
    return SingleChildScrollView(
      child: Center(
        child: Card(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.album),
                    title: Text(subjects[index].title),
                    subtitle: Text(subjects[index].description),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(subjects[index].lecturer.name),
                      TextButton(
                        child: const Text('ENTER'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LessonPage(
                                  subject:
                                      subjects[index], // Pass the subject data
                                  // You can pass other necessary data here
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
        ),
      ),
    );
  }
}
