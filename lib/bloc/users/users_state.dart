part of 'users_bloc.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.initial() = _Initial;
  const factory UsersState.loading() = _Loading;
  const factory UsersState.loaded(UserResponseModel user) = _Loaded;
  const factory UsersState.error(String message) = _Error;
}
