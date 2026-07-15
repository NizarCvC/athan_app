import 'package:flutter_bloc/flutter_bloc.dart';

part 'dua_state.dart';

class DuaCubit extends Cubit<DuaState> {
  DuaCubit() : super(DuaInitial());
}
