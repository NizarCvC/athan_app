import 'package:athan_app/models/zakat_nisab_models/zakat_data.dart';
import 'package:athan_app/models/zakat_nisab_models/zakat_nisab_params.dart';
import 'package:athan_app/services/zakat_nisab_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'zakat_nisab_state.dart';

class ZakatNisabCubit extends Cubit<ZakatNisabState> {
  ZakatNisabCubit() : super(ZakatNisabInitial());

  final _zakatNisabServices = ZakatNisabServices();

  // Future<void> fetchZakatNisabInfo() {

  // }
}
