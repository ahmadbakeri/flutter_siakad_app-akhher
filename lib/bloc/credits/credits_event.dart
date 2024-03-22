part of 'credits_bloc.dart';

@freezed
class CreditsEvent with _$CreditsEvent {
  const factory CreditsEvent.started() = _Started;
  const factory CreditsEvent.getCredits() = _GetCredits;
}