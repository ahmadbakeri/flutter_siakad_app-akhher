import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasources/user_remote_datasource.dart';
import '../../data/models/response/user_response_model.dart';

part 'users_event.dart';
part 'users_state.dart';
part 'users_bloc.freezed.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(_Initial()) {
    on<_GetUser>((event, emit) async {
      emit(_Loading());
      final response = await UserRemoteDatasource().getUser();
      response.fold(
        (l) => emit(_Error(l)),
        (user) => emit(_Loaded(user)),
      ); 
    });
  }
}
