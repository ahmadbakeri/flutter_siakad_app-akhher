part of 'attendances_bloc.dart';

@freezed
class AttendancesState with _$AttendancesState {
  const factory AttendancesState.initial() = _Initial;
  const factory AttendancesState.loading() = _Loading;
  const factory AttendancesState.loaded(List<Attendance> attendances) = _Loaded;
  const factory AttendancesState.error(String message) = _Error;  
}
