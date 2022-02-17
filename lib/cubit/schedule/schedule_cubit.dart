import 'dart:developer';

import 'package:amikom_wan/data/model/schedule/schedule_model.dart';
import 'package:amikom_wan/data/repository/schedule/schedule_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleInitial());

  void get() async {
    emit(ScheduleLoading());

    var repository = await ScheduleRepository(Dio()).get('19.11.2742');

    repository.fold(
      (err) {
        emit(ScheduleError(err));
      },
      (data) {
        log(data.toString());
        emit(ScheduleSuccess(data));
      },
    );
  }
}
