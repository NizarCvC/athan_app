import 'package:flutter_bloc/flutter_bloc.dart';

part 'ruqyah_state.dart';

class RuqyahCubit extends Cubit<RuqyahState> {
  RuqyahCubit() : super(RuqyahInitial());
}
