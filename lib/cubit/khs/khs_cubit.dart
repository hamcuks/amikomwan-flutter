import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/models.dart';
import '../../data/repository/repositories.dart';

part 'khs_state.dart';

class KhsCubit extends Cubit<KhsState> {
  KhsCubit() : super(KhsInitial());

  void get(int? semester, String? tahunAkademik) async {
    emit(KhsLoading());

    var repository = await KHSRepository(Dio()).get(semester!, tahunAkademik!);

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
