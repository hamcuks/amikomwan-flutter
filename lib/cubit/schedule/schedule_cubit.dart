import 'dart:developer';

import '../../data/model/schedule/schedule_model.dart';
import '../../data/repository/schedule/schedule_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../helper/helper.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleInitial());

  void get() async {
    emit(ScheduleLoading());

    // check connection
    var isOnline = await Helper().checkConnection();

    // open hive box
    var box = await Hive.openBox('app_config');

    if (isOnline) {
      // get schedule from remote data
      var repository = await ScheduleRepository(Dio()).get('19.11.2742');

      repository.fold(
        (err) {
          emit(ScheduleError(err));
        },
        (data) {
          log(data.toString());
          emit(ScheduleSuccess(data));
          // emit(ScheduleLoading());
        },
      );
    } else {
      // get schedule from local data
      List<ScheduleModel> data =
          await box.get('schedule_data') ?? <ScheduleModel>[];

      emit(ScheduleSuccess(data));
    }
  }
}
