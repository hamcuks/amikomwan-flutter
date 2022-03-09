import 'dart:developer';

import '../../data/repository/auth/auth_repository.dart';
import '../../helper/helper.dart';
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

        log(data.accessToken.toString(), name: 'login');
      },
    );
  }

  void authPresensi(String npm, String password) async {
    var repository = await AuthRepository(Dio()).loginPresensi(npm, password);

    repository.fold(
      (err) {
        log(err);
      },
      (data) {
        Helper().setToken('access2', data.accessToken!);

        log(data.accessToken.toString(), name: 'auth presensi');
      },
    );
  }

  void logOut() async {
    emit(AuthLoading());
    var box = await Hive.openBox('credentials');

    await box.delete('access_token');
    await box.delete('isLoggedIn');
    emit(AuthSuccess());
  }
}
