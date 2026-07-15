import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dua_state.dart';

class DuaCubit extends Cubit<DuaState> {
  DuaCubit() : super(DuaInitial());
}
