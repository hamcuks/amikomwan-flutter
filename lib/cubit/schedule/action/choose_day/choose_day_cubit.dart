import 'package:bloc/bloc.dart';

class ChooseDayCubit extends Cubit<String> {
  ChooseDayCubit() : super("senin");

  void chooseDay(String day) {
    emit(day);
  }
}
