import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/courses/courses_bloc.dart';
import '../../../common/constants/colors.dart';
import '../../../common/widgets/big_text.dart';
import '../../../common/widgets/search_input.dart';
import '../../../common/widgets/small_text.dart';
import '../../student/attendance_page.dart';
import '../subject_page.dart';
import 'subject_data.dart';

class CoursePageBody extends StatefulWidget {
  const CoursePageBody({super.key});

  @override
  State<CoursePageBody> createState() => _CoursePageBodyState();
}

class _CoursePageBodyState extends State<CoursePageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  @override
  void initState() {
    super.initState();
    context.read<CoursesBloc>().add(const CoursesEvent.getCourses());
  }

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Perkuliahan",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ColorName.primary,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AttendancePage(),
                              ));
                        },
                        icon: const Icon(
                          Icons.qr_code_scanner,
                          color: ColorName.primary,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          color: ColorName.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              SearchInput(
                controller: searchController,
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
        BlocBuilder<CoursesBloc, CoursesState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (data) {
                return Column(
                  children: [
                    Container(
                      // color: Colors.redAccent,
                      height: 280,
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: 5,
                        itemBuilder: (context, position) {
                          return _buildPageItem(position);
                        },
                      ),
                    ),
                    Container(
                      height: 40,
                      margin: const EdgeInsets.only(left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BigText(text: 'Course List'),
                        ],
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SubjectPage(
                                    course:
                                        data[index], // Pass the subject data
                                    // You can pass other necessary data here
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
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
                                          image: AssetImage(
                                              'assets/images/galaxy.png'))),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xFFe8e8e8),
                                            offset: Offset(0, 2),
                                            blurRadius: 5.0,
                                          ),
                                        ]),
                                    height: 100,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          BigText(text: data[index].title),
                                          const SizedBox(height: 5),
                                          SmallText(text: data[index].subtitle),
                                          const SizedBox(height: 5),
                                          SubjectData(
                                              author: 'Akhher',
                                              time: '${data[index].time} h',
                                              category: 'Dynamics'),
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
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        Container(
          height: 220,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven ? const Color(0xFF69c5df) : const Color(0xFF9294cc),
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/galaxy.png')),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 110,
            margin: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFe8e8e8),
                  offset: Offset(0, 5),
                  blurRadius: 5.0,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, 0),
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(5, 0),
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: 'Hukum Newton',
                  ),
                  const SizedBox(height: 5),
                  SmallText(
                      text:
                          'Hukum Newton dalam fisika merangkum. Hukum Newton dalam fisika merangkum.'),
                  const SizedBox(height: 5),
                  const SubjectData(
                    author: 'Akhher',
                    time: '10 m',
                    category: 'Dynamics',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
