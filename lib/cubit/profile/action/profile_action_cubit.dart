import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class ProfileActionCubit extends Cubit<bool> {
  ProfileActionCubit() : super(false);

  void showPassword(bool value) {
    emit(value);
  }
}
