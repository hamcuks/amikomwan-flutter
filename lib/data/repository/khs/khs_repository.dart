import 'dart:developer';

import 'package:amikom_wan/common/constant.dart';
import 'package:amikom_wan/data/model/khs/khs_model.dart';
import 'package:amikom_wan/helper/helper.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class KHSRepository {
  Dio? dio;

  KHSRepository(this.dio);

  Future<Either<String, KHSModel>> get(
      int semester, String tahunAkademik) async {
    // access token
    var token = await Helper().getToken('access');

    // header
    Options options = Options(
      contentType: Headers.formUrlEncodedContentType,
      headers: {
        'User-Agent': userAgent,
        'Authorization': token,
      },
    );

    FormData data = FormData.fromMap(
      {
        'semester': semester,
        'tahun_akademik': tahunAkademik,
      },
    );

    try {
      Response response = await dio!.post(
        baseUrl + 'api/krs/khs',
        options: options,
        data: data,
      );

      if (response.statusCode != 200) throw Error();

      log(response.data.toString());

      return right(KHSModel.fromJson(response.data));
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
