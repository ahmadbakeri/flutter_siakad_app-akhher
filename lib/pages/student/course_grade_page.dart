// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc/attendances_bloc.dart';
import '../../common/constants/colors.dart';
import '../../common/widgets/custom_scaffold.dart';
import 'models/course_grade_model.dart';
import 'widgets/couse_grade_tile.dart';

class CourseGradePage extends StatefulWidget {
  final String name;
  final String role;
  const CourseGradePage({
    super.key,
    required this.name,
    required this.role,
  });

  @override
  State<CourseGradePage> createState() => _CourseGradeState();
}

class _CourseGradeState extends State<CourseGradePage> {
  @override
  void initState() {
    super.initState();
   
    context.read<AttendancesBloc>().add(const AttendancesEvent.getAttendances());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            // padding: const EdgeInsets.all(24.0),
            // shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            children: [
              const Text(
                "Nilai MK",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "14 of 64 results",
                    style: TextStyle(
                      color: ColorName.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list),
                  ),
                ],
              ),
              BlocBuilder<AttendancesBloc, AttendancesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    loaded: (data) {
                      return ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CourseGradeTile(
                            name: widget.name,
                            role: widget.role,
                            data: CourseGradeModel(
                              information: 'Data',
                              attendance: data[index].status,
                              course: data[index].schedule.subject.title,
                              grade: int.parse(data[index].score),
                              description: data[index].description,
                            ),
                          );
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
