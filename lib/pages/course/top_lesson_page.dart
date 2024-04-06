import 'package:flutter/material.dart';
import '../../common/widgets/big_text.dart';
import '../../common/widgets/small_text.dart';
import '../../data/models/response/toplist_response_model.dart';
import 'item_page.dart';
import 'widgets/lesson_data.dart';

class TopLessonPage extends StatelessWidget {
  final TopSubject subject; // Assuming Subject is your data model
  // Add other necessary fields here

  const TopLessonPage({super.key, required this.subject});

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
              background: Image.network(
                subject.image,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: LessonData(
                        author: subject.lecturer.name,
                        time: '${subject.time} min',
                        field: ' ${subject.field}'),
                  ),
                  const SizedBox(height: 10),
                  SmallText(
                    text: subject.description,
                    maxLines: 1000,
                  ),
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
                      BigText(text: lessons.length.toString()),
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
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xFFe8e8e8),
                                offset: Offset(0, 5),
                                blurRadius: 5.0,
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SmallText(text: lessons[index].title),
                                  SmallText(text: '${lessons[index].time} min'),
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
                                          gdriveLink: lessons[index].gdriveLink,
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
