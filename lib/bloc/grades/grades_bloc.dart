import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/datasources/grade_remote_datasource.dart';
import '../../data/models/response/grade_response_model.dart';
part 'grades_event.dart';
part 'grades_state.dart';
part 'grades_bloc.freezed.dart';

class GradesBloc extends Bloc<GradesEvent, GradesState> {
  GradesBloc() : super(const _Initial()) {
    on<_GetGrades>((event, emit) async {
      emit(const _Loading());
      final response = await GradeRemoteDatasource().getGrades();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data)),
      );
    });
  }
}
