import 'package:flutter_bloc/flutter_bloc.dart';

part 'fasting_state.dart';

class FastingCubit extends Cubit<FastingState> {
  FastingCubit() : super(FastingInitial());
}
