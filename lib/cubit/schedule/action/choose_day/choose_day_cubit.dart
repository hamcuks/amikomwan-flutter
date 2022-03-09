import 'package:bloc/bloc.dart';

class ChooseDayCubit extends Cubit<int> {
  ChooseDayCubit() : super(1);

  void chooseDay(int day) {
    emit(day);
  }
}
