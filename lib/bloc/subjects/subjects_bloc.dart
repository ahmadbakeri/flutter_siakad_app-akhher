import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/datasources/subject_remote_datasource.dart';
import '../../data/models/response/subject_response_model.dart';
part 'subjects_event.dart';
part 'subjects_state.dart';
part 'subjects_bloc.freezed.dart';

class SubjectsBloc extends Bloc<SubjectsEvent, SubjectsState> {
  SubjectsBloc() : super(const _Initial()) {
    on<_GetSubjects>((event, emit) async {
      emit(const _Loading());
      final response = await SubjectRemoteDatasource().getSubjects();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data)),
      );
    });
  }
}
