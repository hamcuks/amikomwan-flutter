import 'dart:developer';

import '../../../data/model/profile/profile_model.dart';
import '../../../data/repository/profile/profile_repository.dart';
import '../../../helper/helper.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void get() async {
    emit(ProfileLoading());

    // check connection
    var isOnline = await Helper().checkConnection();

    // open hive box
    var box = await Hive.openBox('app_config');

    await ProfileRepository(Dio()).get();

    // get profile data from local
    ProfileModel data = await box.get('profile_data');
    emit(ProfileSuccess(data));
  }
}
