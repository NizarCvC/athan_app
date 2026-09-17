part of 'fasting_cubit.dart';

sealed class FastingState {}

final class FastingInitial extends FastingState {}

final class FetchingFastingInfo extends FastingState {}

final class FetchedFastingInfo extends FastingState {
  final FastingData? fastingData;

  FetchedFastingInfo({required this.fastingData});
}

final class FetchingFastingInfoFailed extends FastingState {
  final String errorMessage;

  FetchingFastingInfoFailed(this.errorMessage);
}
