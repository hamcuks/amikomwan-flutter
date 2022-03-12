import '../../../data/model/models.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repository/repositories.dart';

part 'data_presensi_state.dart';

class DataPresensiCubit extends Cubit<DataPresensiState> {
  DataPresensiCubit() : super(DataPresensiInitial());

  void get() async {
    emit(DataPresensiLoading());

    var repository = await PresensiRepository(Dio()).getDataPresensi();

    repository.fold((l) => emit(DataPresensiError(l)), (data) {
      emit(DataPresensiSuccess(data));
    });
  }
}
