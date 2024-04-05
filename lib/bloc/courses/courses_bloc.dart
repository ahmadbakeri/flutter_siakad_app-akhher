import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/datasources/course_remote_datasource.dart';
import '../../data/models/response/course_response_model.dart';
part 'courses_event.dart';
part 'courses_state.dart';
part 'courses_bloc.freezed.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  CoursesBloc() : super(const _Initial()) {
    on<_GetCourses>((event, emit) async {
      emit(const _Loading());
      final response = await CourseRemoteDatasource().getCourses();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data)),
      );
    });
  }
}
