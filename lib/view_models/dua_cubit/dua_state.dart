part of 'dua_cubit.dart';

sealed class DuaState {}

final class DuaInitial extends DuaState {}

final class FetchingRandomDua extends DuaState {}

final class FetchedRandomDua extends DuaState {
  final DuaTranslation duaTranslation;

  FetchedRandomDua({required this.duaTranslation});
}

final class FetchingRandomDuaFailed extends DuaState {
  final String errorMessage;

  FetchingRandomDuaFailed(this.errorMessage);
}
