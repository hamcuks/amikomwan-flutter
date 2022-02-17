import 'dart:developer';

import 'package:amikom_wan/data/model/profile/profile_model.dart';
import 'package:amikom_wan/data/repository/profile/profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void get() async {
    emit(ProfileLoading());

    var repository = await ProfileRepository(Dio()).get();

    repository.fold(
      (err) {
        emit(ProfileError(err));
      },
      (data) {
        log(data.toString());
        emit(ProfileSuccess(data));
      },
    );
  }
}
