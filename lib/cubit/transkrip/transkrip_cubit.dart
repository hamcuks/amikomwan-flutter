import 'dart:developer';

import 'package:amikom_wan/data/model/transkrip/transkrip_model.dart';
import 'package:amikom_wan/data/repository/transkrip/transkrip_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

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
      },
    );
  }
}
