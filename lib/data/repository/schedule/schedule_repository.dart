import 'dart:developer';

import 'package:amikom_wan/common/constant.dart';
import 'package:amikom_wan/data/model/schedule/schedule_model.dart';
import 'package:amikom_wan/helper/helper.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ScheduleRepository {
  Dio? dio;

  ScheduleRepository(this.dio);

  Future<Either<String, List<ScheduleModel>>> get(String npm) async {
    // access token
    var token = await Helper().getToken('access');

    // header
    Options options = Options(headers: {
      'User-Agent': userAgent,
      'Authorization': token,
    });

    FormData data = FormData.fromMap({'npm': npm});

    try {
      Response response = await dio!.post(
        baseUrl + 'api/personal/jadwal_kuliah',
        options: options,
        data: data,
      );

      if (response.statusCode != 200) throw Error();
      if (response.data.length <= 0) {
        return right(
          <ScheduleModel>[],
        );
      }

      return right(
        List<ScheduleModel>.from(
            response.data.map((x) => ScheduleModel.fromJson(x))),
      );
    } on DioError catch (e) {
      log(e.message);
      switch (e.type) {
        case DioErrorType.connectTimeout:
          return left('Gagal Login, Pastikan Terkoneksi ke Internet');
        case DioErrorType.response:
          return left('Gagal Login, Pastikan NIM dan Password Benar');
        default:
          return left(e.message);
      }
    }
  }
}
