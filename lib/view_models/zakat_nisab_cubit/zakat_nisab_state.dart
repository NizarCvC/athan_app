part of 'zakat_nisab_cubit.dart';

sealed class ZakatNisabState {}

final class ZakatNisabInitial extends ZakatNisabState {}

final class FetchingZakatNisab extends ZakatNisabState {}

final class FetchedZakatNisab extends ZakatNisabState {
  final ZakatData zakatInfo;

  FetchedZakatNisab({required this.zakatInfo});
}

final class FetchingZakatNisabFailed extends ZakatNisabState {
  final String errorMessage;

  FetchingZakatNisabFailed(this.errorMessage);
}
