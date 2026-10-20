part of 'asma_ul_husna_cubit.dart';

sealed class AsmaUlHusnaState {}

final class AsmaUlHusnaInitial extends AsmaUlHusnaState {}

final class FetchingAsmaUlHusna extends AsmaUlHusnaState {}

final class FetchedAsmaUlHusna extends AsmaUlHusnaState {
  final AsmaUlHusnaData asmaUlHusnaData;

  FetchedAsmaUlHusna({required this.asmaUlHusnaData});
}

final class FetchingAsmaUlHusnaFailed extends AsmaUlHusnaState {
  final String message;

  FetchingAsmaUlHusnaFailed(this.message);
}