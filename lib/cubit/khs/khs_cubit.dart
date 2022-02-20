import 'dart:developer';

import 'package:amikom_wan/data/model/khs/khs_model.dart';
import 'package:amikom_wan/data/repository/khs/khs_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'khs_state.dart';

class KhsCubit extends Cubit<KhsState> {
  KhsCubit() : super(KhsInitial());

  void get(int semester, String tahunAkademik) async {
    emit(KhsLoading());

    var repository = await KHSRepository(Dio()).get(semester, tahunAkademik);

    repository.fold(
      (err) {
        log(err);
        emit(KhsError(err));
      },
      (data) {
        // log(data.transkrip![20].namaMk.toString(), name: "TRANSKRIP");
        // emit(KhsLoading());
        emit(KhsSuccess(data));
      },
    );
  }
}
