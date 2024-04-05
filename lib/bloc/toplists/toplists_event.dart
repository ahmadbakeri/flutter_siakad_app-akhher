part of 'toplists_bloc.dart';

@freezed
class ToplistsEvent with _$ToplistsEvent {
  const factory ToplistsEvent.started() = _Started;
  const factory ToplistsEvent.getToplists() = _GetToplists;
}