import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/courses/courses_bloc.dart';
import 'subject_page.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  void initState() {
    super.initState();
    context.read<CoursesBloc>().add(const CoursesEvent.getCourses());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BlocBuilder<CoursesBloc, CoursesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (data) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.blue,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data[index].title),
                                Text(data[index].subtitle),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('${data[index].time} jam'),
                                    TextButton(
                                      child: const Text('ENTER'),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return SubjectPage(
                                                course: data[
                                                    index], // Pass the subject data
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
                            ),
                          );

                          // Column(
                          //   children: [
                          //     ListTile(
                          //       leading: const Icon(Icons.album),
                          //       title: Text(data[index].title),
                          //       subtitle: Text(data[index].subtitle),
                          //     ),
                          // Row(
                          //   mainAxisAlignment:
                          //       MainAxisAlignment.spaceBetween,
                          //   children: <Widget>[
                          //     Text(data[index].time),
                          //     TextButton(
                          //       child: const Text('ENTER'),
                          //       onPressed: () {
                          //         Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //             builder: (context) {
                          //               return SubjectPage(
                          //                 course: data[
                          //                     index], // Pass the subject data
                          //                 // You can pass other necessary data here
                          //               );
                          //             },
                          //           ),
                          //         );
                          //       },
                          //     ),
                          //   ],
                          // ),
                          //   ],
                          // );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
