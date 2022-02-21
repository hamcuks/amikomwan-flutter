import 'dart:developer';

import 'package:amikom_wan/data/repository/auth/auth_repository.dart';
import 'package:amikom_wan/helper/helper.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(String npm, String password) async {
    var box = await Hive.openBox('credentials');
    emit(AuthLoading());

    var repository = await AuthRepository(Dio()).login(npm, password);

    repository.fold(
      (err) {
        emit(AuthError(err));
        log(err);
      },
      (data) {
        emit(AuthSuccess());
        Helper().setToken('access', data.accessToken!);
        box.put('npm', npm);
        box.put('password', password);
        box.put('isLoggedIn', true);

        log(data.accessToken.toString());
      },
    );
  }
}
