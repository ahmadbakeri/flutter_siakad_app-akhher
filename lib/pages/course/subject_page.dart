// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../common/widgets/big_text.dart';
import '../../common/widgets/small_text.dart';
import '../../data/models/response/course_response_model.dart';
import 'lesson_page.dart';
import 'widgets/subject_data.dart';

class SubjectPage extends StatelessWidget {
  final Course course;
  const SubjectPage({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subjects = course.subjects;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: BigText(
          text: course.title,
          color: Colors.white,
          size: 20,
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LessonPage(
                          subject: subjects[index], // Pass the subject data
                          // You can pass other necessary data here
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: Row(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/galaxy.png'))),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: Colors.white),
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(text: subjects[index].title),
                                const SizedBox(height: 5),
                                SmallText(
                                    text:
                                        'Hukum Newton dalam fisika merangkum'),
                                const SizedBox(height: 5),
                                SubjectData(
                                    author: subjects[index].lecturer.name,
                                    time: '10 m',
                                    category: ''),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
