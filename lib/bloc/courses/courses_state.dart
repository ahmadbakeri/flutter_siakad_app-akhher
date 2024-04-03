part of 'courses_bloc.dart';

@freezed
class CoursesState with _$CoursesState {
  const factory CoursesState.initial() = _Initial;
  const factory CoursesState.loading() = _Loading;
  const factory CoursesState.loaded(List<Course> courses) = _Loaded;
  const factory CoursesState.error(String message) = _Error;
}
