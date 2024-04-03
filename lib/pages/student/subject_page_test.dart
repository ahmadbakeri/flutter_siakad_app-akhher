// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../bloc/subjects/subjects_bloc.dart';
// import 'lesson_page.dart';

// class SubjectPage extends StatefulWidget {
//   const SubjectPage({super.key});

//   @override
//   State<SubjectPage> createState() => _SubjectPageState();
// }

// class _SubjectPageState extends State<SubjectPage> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<SubjectsBloc>().add(const SubjectsEvent.getSubjects());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Center(
//         child: Card(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               BlocBuilder<SubjectsBloc, SubjectsState>(
//                 builder: (context, state) {
//                   return state.maybeWhen(
//                     orElse: () => const Center(
//                       child: CircularProgressIndicator(),
//                     ),
//                     loaded: (data) {
//                       return ListView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: data.length,
//                         itemBuilder: (context, index) {
//                           return Column(
//                             children: [
//                               ListTile(
//                                 leading: const Icon(Icons.album),
//                                 title: Text(data[index].title),
//                                 subtitle: Text(data[index].description),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: <Widget>[
//                                   TextButton(
//                                     child: const Text('ENTER'),
//                                     onPressed: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) {
//                                             return LessonPage(
//                                               subject: data[
//                                                   index], // Pass the subject data
//                                               // You can pass other necessary data here
//                                             );
//                                           },
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ],
//                               ),
//                               Text(data[index].lecturer.name),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
