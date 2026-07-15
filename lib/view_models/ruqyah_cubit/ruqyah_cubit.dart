import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ruqyah_state.dart';

class RuqyahCubit extends Cubit<RuqyahState> {
  RuqyahCubit() : super(RuqyahInitial());
}
