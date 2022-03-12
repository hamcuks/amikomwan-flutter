import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repository/repositories.dart';

part 'send_qr_state.dart';

class SendQrCubit extends Cubit<SendQrState> {
  SendQrCubit() : super(SendQrInitial());

  void sendQr(String code) async {
    emit(SendQrLoading());

    var repository = await PresensiRepository(Dio()).sendQr(code);

    repository.fold(
      (l) => emit(
        SendQrError(l.statusCode!),
      ),
      (r) => emit(
        SendQrSuccess(),
      ),
    );
  }
}
