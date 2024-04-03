import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasources/course_remote_datasource.dart';
import '../../data/models/response/course_response_model.dart';

part 'courses_event.dart';
part 'courses_state.dart';
part 'courses_bloc.freezed.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  CoursesBloc() : super(_Initial()) {
    on<CoursesEvent>((event, emit) async {
      emit(_Loading());
      final response = await CourseRemoteDatasource().getCourses();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data)),
      );
    });
  }
}
