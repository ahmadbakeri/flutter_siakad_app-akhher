import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/schedules/schedules_bloc.dart';
import '../../common/extensions/date_time_ext.dart';
import '../../common/constants/images.dart';
import '../../common/widgets/custom_scaffold.dart';
import '../student/models/course_schedule_model.dart';
import 'widgets/subject_schedule_tile.dart';
import 'widgets/subject_with_image.dart';

class CourseSchedulePage extends StatefulWidget {
  const CourseSchedulePage({super.key});

  @override
  State<CourseSchedulePage> createState() => _CourseSchedulePageState();
}

class _CourseSchedulePageState extends State<CourseSchedulePage> {
  @override
  void initState() {
    super.initState();
    context.read<SchedulesBloc>().add(const SchedulesEvent.getSchedules());
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
                "Jadwal MK",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CourseWithImage(
                      name: 'Basis Data',
                      imagePath: Images.basisData,
                    ),
                    CourseWithImage(
                      name: 'Algoritma',
                      imagePath: Images.algoritma,
                    ),
                    CourseWithImage(
                      name: 'RPL',
                      imagePath: Images.rpl,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                DateTime.now().toFormattedDateWithDay(),
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 18.0),
              BlocBuilder<SchedulesBloc, SchedulesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (data) {
                      var filterredSchedules = data
                          .where((schedule) =>
                              schedule.day.toLowerCase() ==
                              DateTime.now().toFormattedDay().toLowerCase())
                          .toList();
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filterredSchedules.length,
                        itemBuilder: (context, index) {
                          return CourseScheduleTile(
                            data: CourseScheduleModel(
                              dateStart: DateTime.now(),
                              longTimeTeaching: 90,
                              course: filterredSchedules[index].subject.title,
                              lecturer: filterredSchedules[index]
                                  .subject
                                  .lecturer
                                  .name,
                              description: filterredSchedules[index].room,
                              startTime: filterredSchedules[index].startTime,
                              endTime: filterredSchedules[index].endTime,
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
