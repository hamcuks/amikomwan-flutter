import 'package:bloc/bloc.dart';

class ProfileActionCubit extends Cubit<bool> {
  ProfileActionCubit() : super(false);

  void showPassword(bool value) {
    emit(value);
  }
}
