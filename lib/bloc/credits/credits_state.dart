part of 'credits_bloc.dart';

@freezed
class CreditsState with _$CreditsState {
  const factory CreditsState.initial() = _Initial;
  const factory CreditsState.loading() = _Loading;
  const factory CreditsState.loaded(List<Credit> credits) = _Loaded;
  const factory CreditsState.error(String message) = _Error;
}
