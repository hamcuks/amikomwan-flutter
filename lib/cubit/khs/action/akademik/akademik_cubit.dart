import 'dart:developer';

import '../../../../data/model/models.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../data/repository/repositories.dart';

part 'akademik_state.dart';

class AkademikCubit extends Cubit<AkademikState> {
  AkademikCubit() : super(AkademikInitial());

  void get() async {
    log("Exec Akademik Cubit");
    emit(AkademikLoading());

    // open hive box
    var box = await Hive.openBox('app_config');

    await KHSRepository(Dio()).getAkademik();
    try {
      AkademikModel data = box.get('akademik');
      log(data.toJson().toString());
      emit(AkademikSuccess(data));
    } catch (e) {
      emit(const AkademikError('Gagal Mendapatkan data'));
    }
  }
}
