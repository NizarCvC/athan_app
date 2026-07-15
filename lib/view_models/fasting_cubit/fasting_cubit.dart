import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fasting_state.dart';

class FastingCubit extends Cubit<FastingState> {
  FastingCubit() : super(FastingInitial());
}
