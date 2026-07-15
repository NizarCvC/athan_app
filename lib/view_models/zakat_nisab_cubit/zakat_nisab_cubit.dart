import 'package:flutter_bloc/flutter_bloc.dart';

part 'zakat_nisab_state.dart';

class ZakatNisabCubit extends Cubit<ZakatNisabState> {
  ZakatNisabCubit() : super(ZakatNisabInitial());
}
