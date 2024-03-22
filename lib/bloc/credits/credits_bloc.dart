import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasources/credit_remote_datasource.dart';
import '../../data/models/response/credit_response_model.dart';

part 'credits_event.dart';
part 'credits_state.dart';
part 'credits_bloc.freezed.dart';

class CreditsBloc extends Bloc<CreditsEvent, CreditsState> {
  CreditsBloc() : super(_Initial()) {
    on<_GetCredits>((event, emit) async {
      emit(const _Loading());
      final response = await CreditRemoteDatasource().getCredits();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data)),
      );
    });
  }
}
