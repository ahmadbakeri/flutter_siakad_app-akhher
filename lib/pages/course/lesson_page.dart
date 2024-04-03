import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../common/constants/images.dart';
import '../../common/widgets/big_text.dart';
import '../../common/widgets/small_text.dart';
import '../../data/models/response/course_response_model.dart';
import 'item_page.dart';
import 'widgets/subject_data.dart';

class LessonPage extends StatelessWidget {
  final Subject subject; // Assuming Subject is your data model
  // Add other necessary fields here

  const LessonPage({Key? key, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract lesson data from the subject
    final lessons = subject.lessons;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(Images.galaxy),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200],
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 16,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 230,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BigText(
                        text: 'Hukum Newton',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const SubjectData(
                    author: 'Akhher',
                    time: '10 m',
                    rating: '4.1 / 5.0',
                    category: 'Dynamics',
                  ),
                  const SizedBox(height: 10),
                  SmallText(
                      text:
                          'Hukum Newton dalam fisika merangkum tiga hukum gerak penting. Hukum pertama menyatakan benda akan tetap diam atau bergerak lurus kecuali ada gaya'),
                  const SizedBox(height: 20),
                  Container(
                    width: double.maxFinite,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(text: 'Lessons', size: 20),
                      BigText(text: '4 items', size: 20),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: lessons.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 2.0,
                            clipBehavior: Clip.hardEdge,
                            child: InkWell(
                              splashColor: Colors.white,
                              onTap: () {},
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                width: double.maxFinite,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        SmallText(text: lessons[index].title),
                                        SmallText(
                                            text:
                                                '${lessons[index].minutes} min'),
                                      ],
                                    ),
                                    TextButton(
                                      child: const Text('ENTER'),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return ItemPage(title: lessons[index].title, description: lessons[index].description, videoId: lessons[index].youtubeLink,);
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ListView.builder(
//         itemCount: lessons.length,
//         itemBuilder: (context, index) {
//           return Card(
//             elevation: 2.0,
//             clipBehavior: Clip.hardEdge,
//             child: InkWell(
//               splashColor: Colors.white,
//               onTap: () {},
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 width: double.maxFinite,
//                 height: 50,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SmallText(text: lessons[index].title),
//                     SmallText(text: '${lessons[index].minutes} min'),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
