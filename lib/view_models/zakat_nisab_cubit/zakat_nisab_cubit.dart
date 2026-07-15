import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'zakat_nisab_state.dart';

class ZakatNisabCubit extends Cubit<ZakatNisabState> {
  ZakatNisabCubit() : super(ZakatNisabInitial());
}
