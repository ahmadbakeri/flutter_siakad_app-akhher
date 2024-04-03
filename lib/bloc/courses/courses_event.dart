part of 'courses_bloc.dart';

@freezed
class CoursesEvent with _$CoursesEvent {
  const factory CoursesEvent.started() = _Started;
  const factory CoursesEvent.getCourses() = _GetCourses;
}