import 'dart:developer';

import 'package:amikom_wan/data/model/khs/khs_model.dart';
import 'package:amikom_wan/data/repository/khs/khs_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'khs_state.dart';

class KhsCubit extends Cubit<KhsState> {
  KhsCubit() : super(KhsInitial());

  void get() async {
    emit(KhsLoading());

    var box = await Hive.openBox('credentials');
    String npm = box.get('npm');

    var repository = await KHSRepository(Dio()).get(npm);

    repository.fold(
      (err) {
        log(err);
        emit(KhsError(err));
      },
      (data) {
        // log(data.transkrip![20].namaMk.toString(), name: "TRANSKRIP");
        emit(KhsSuccess(data));
      },
    );
  }
}
