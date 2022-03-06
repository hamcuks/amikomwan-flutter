import 'dart:developer';

import 'package:amikom_wan/data/model/auth/presensi/data_presensi_model.dart';
import 'package:amikom_wan/data/repository/presensi/presensi_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'data_presensi_state.dart';

class DataPresensiCubit extends Cubit<DataPresensiState> {
  DataPresensiCubit() : super(DataPresensiInitial());

  void get() async {
    emit(DataPresensiLoading());

    var repository = await PresensiRepository(Dio()).getDataPresensi();

    repository.fold((l) => log(l), (data) {
      emit(DataPresensiSuccess(data));
    });
  }
}
