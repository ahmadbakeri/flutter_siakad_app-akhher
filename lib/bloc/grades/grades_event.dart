part of 'grades_bloc.dart';

@freezed
class GradesEvent with _$GradesEvent {
  const factory GradesEvent.started() = _Started;
  const factory GradesEvent.getGrades() = _GetGrades;
}