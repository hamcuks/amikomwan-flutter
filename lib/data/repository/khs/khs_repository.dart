import 'dart:developer';

import '../../../common/constant.dart';
import '../../model/khs/akademik/akademik_model.dart';
import '../../model/khs/khs_model.dart';
import '../../../helper/helper.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

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

  Future<void> getAkademik() async {
    log("Exec Get Akademik");

    // access token
    var token = await Helper().getToken('access');

    // init hive box
    var box = await Hive.openBox('credentials');
    var appConfigBox = await Hive.openBox('app_config');

    // get NPM
    String npm = await box.get('npm');

    // header
    Options options = Options(
      contentType: Headers.formUrlEncodedContentType,
      headers: {
        'User-Agent': userAgent,
        'Authorization': token,
      },
    );

    FormData formData = FormData.fromMap(
      {
        'npm': npm,
      },
    );

    try {
      Response response = await dio!.post(
        baseUrl + 'api/krs/init_khs',
        options: options,
        data: formData,
      );

      if (response.statusCode != 200) throw Error();

      AkademikModel data = AkademikModel.fromJson(response.data);
      await appConfigBox.put('akademik', data);
    } on DioError catch (e) {
      log(e.message);
    }
  }
}
