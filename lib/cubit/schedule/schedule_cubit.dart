import '../../data/model/models.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/repository/repositories.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleInitial());

  void get() async {
    emit(ScheduleLoading());

    // open hive box
    var box = await Hive.openBox('app_config');

    // get schedule from remote data
    await ScheduleRepository(Dio()).get('19.11.2742');

    // get schedule from local data
    List<ScheduleModel> data =
        await box.get('schedule_data') ?? <ScheduleModel>[];

    emit(ScheduleSuccess(data));
  }
}
