import 'package:flutter/material.dart';
import '../../common/widgets/big_text.dart';
import '../../common/widgets/small_text.dart';
import '../../data/models/response/course_response_model.dart';
import 'item_page.dart';
import 'widgets/subject_data.dart';

class LessonPage extends StatelessWidget {
  final Subject subject; // Assuming Subject is your data model
  // Add other necessary fields here

  const LessonPage({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    // Extract lesson data from the subject
    final lessons = subject.lessons;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            toolbarHeight: 70,
            pinned: true,
            backgroundColor: Colors.blue,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/galaxy.png',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Center(child: BigText(text: subject.title, size: 20)),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  SubjectData(
                    author: subject.lecturer.name,
                    time: subject.code,
                    category: 'Dynamics',
                  ),
                  const SizedBox(height: 10),
                  SmallText(
                      text:
                          'Hukum Newton dalam fisika merangkum tiga hukum gerak penting. Hukum pertama menyatakan benda akan tetap diam atau bergerak lurus kecuali ada gaya. Hukum Newton dalam fisika merangkum tiga hukum gerak penting. Hukum pertama menyatakan benda akan tetap diam atau bergerak lurus kecuali ada gaya. Hukum Newton dalam fisika merangkum tiga hukum gerak penting. Hukum pertama menyatakan benda akan tetap diam atau bergerak lurus kecuali ada gaya. Hukum Newton dalam fisika merangkum tiga hukum gerak penting. Hukum pertama menyatakan benda akan tetap diam atau bergerak lurus kecuali ada gaya.Hukum Newton dalam fisika merangkum tiga hukum gerak penting. Hukum pertama menyatakan benda akan tetap diam atau bergerak lurus kecuali ada gaya.Hukum Newton dalam fisika merangkum tiga hukum gerak penting. Hukum pertama menyatakan benda akan tetap diam atau bergerak lurus kecuali ada gaya'),
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
                      BigText(text: 'Lessons'),
                      BigText(text: '4 items'),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: lessons.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          width: double.maxFinite,
                          // height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SmallText(text: lessons[index].title),
                                  SmallText(
                                      text: '${lessons[index].minutes} min'),
                                ],
                              ),
                              TextButton(
                                child: const Text('ENTER'),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ItemPage(
                                          title: lessons[index].title,
                                          description:
                                              lessons[index].description,
                                          videoId: lessons[index].youtubeLink,
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
