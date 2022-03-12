import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/repository/repositories.dart';

part 'ktm_state.dart';

class KtmCubit extends Cubit<KtmState> {
  KtmCubit() : super(KtmInitial());

  void get() async {
    log("Exec KTM Cubit");
    emit(KtmLoading());

    // open hive box
    var box = await Hive.openBox('credentials');
    var app = await Hive.openBox('app_config');

    String npm = box.get('npm') ?? '';

    await KtmRepository(Dio()).get(npm);

    try {
      String ktmImage = app.get('ktmImage');
      Uint8List data = const Base64Codec().decode(ktmImage);

      log(ktmImage);
      emit(KtmSuccess(data));
    } catch (e) {
      emit(const KtmError('Gagal Mendapatkan data'));
    }
  }
}
