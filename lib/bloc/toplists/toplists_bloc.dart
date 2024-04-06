import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/datasources/toplist_remote_datasource.dart';
import '../../data/models/response/toplist_response_model.dart';
part 'toplists_event.dart';
part 'toplists_state.dart';
part 'toplists_bloc.freezed.dart';

class ToplistsBloc extends Bloc<ToplistsEvent, ToplistsState> {
  ToplistsBloc() : super(const _Initial()) {
    on<_GetToplists>((event, emit) async {
      emit(const _Loading());
      final response = await ToplistRemoteDatasource().getToplist();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(
          _Loaded(r.data),
        ),
      );
    });
  }
}
