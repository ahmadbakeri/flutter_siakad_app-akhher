part of 'attendances_bloc.dart';

@freezed
class AttendancesEvent with _$AttendancesEvent {
  const factory AttendancesEvent.started() = _Started;
  const factory AttendancesEvent.getAttendances() = _GetAttendances;
}