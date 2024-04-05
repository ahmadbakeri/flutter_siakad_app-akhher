part of 'toplists_bloc.dart';

@freezed
class ToplistsState with _$ToplistsState {
  const factory ToplistsState.initial() = _Initial;
  const factory ToplistsState.loading() = _Loading;
  const factory ToplistsState.loaded(List<Toplist> data) = _Loaded;
  const factory ToplistsState.error(String message) = _Error;
}
