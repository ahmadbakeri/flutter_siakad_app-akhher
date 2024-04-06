import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasources/attendance_remote_datasource.dart';
import '../../data/models/response/attendance_response_model.dart';

part 'attendances_event.dart';
part 'attendances_state.dart';
part 'attendances_bloc.freezed.dart';

class AttendancesBloc extends Bloc<AttendancesEvent, AttendancesState> {
  AttendancesBloc() : super(const _Initial()) {
    on<_GetAttendances>((event, emit) async {
      emit(const _Loading());
      final response = await AttendanceRemoteDatasource().getAttendances();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data)),
      );
    });
  }
}
