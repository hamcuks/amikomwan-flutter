import 'dart:developer';

import '../../data/model/models.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../data/repository/repositories.dart';

part 'transkrip_state.dart';

class TranskripCubit extends Cubit<TranskripState> {
  TranskripCubit() : super(TranskripInitial());

  void get() async {
    emit(TranskripLoading());

    var box = await Hive.openBox('credentials');
    String npm = box.get('npm');

    var repository = await TranskripRepository(Dio()).get(npm);

    repository.fold(
      (err) {
        log(err);
        emit(TranskripError(err));
      },
      (data) {
        // log(data.transkrip![20].namaMk.toString(), name: "TRANSKRIP");
        emit(TranskripSuccess(data));
        // emit(TranskripLoading());
      },
    );
  }
}
