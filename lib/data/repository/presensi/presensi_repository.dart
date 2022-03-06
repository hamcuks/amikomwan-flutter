import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../common/constant.dart';
import '../../../helper/helper.dart';
import '../../model/auth/presensi/data_presensi_model.dart';

class PresensiRepository {
  Dio? dio;

  PresensiRepository(this.dio);

  Future<Either<Response, bool>> sendQr(String code) async {
    // open Hive box
    var box = await Hive.box('credentials');

    // get data npm
    String npm = box.get('npm') ?? '';

    // header
    Options options = Options(headers: {
      'User-Agent': userAgent,
    });

    // data
    Map<String, dynamic> data = {
      'data': '$code;$npm',
    };

    try {
      Response response = await dio!.post(
        'http://202.91.9.14:6000/api/presensi_mobile/validate_qr_code',
        options: options,
        data: data,
      );

      if (response.statusCode != 200) throw Error();

      log(data.toString());

      return right(true);
    } on DioError catch (e) {
      log(e.message);

      return left(e.response!);
    }
  }

  Future<Either<String, List<DataPresensiModel>>> getDataPresensi() async {
    // access token
    var token = await Helper().getToken('access');

    // open Hive box
    var box = await Hive.openBox('app_config');
    var credentialsBox = await Hive.openBox('credentials');

    // data
    int _semester = box.get('semester') ?? 1;
    String _tahunAkademik = box.get('tahunAkademik') ?? '2019/2022';
    String _npm = credentialsBox.get('npm');

    // header
    Options options = Options(headers: {
      'User-Agent': userAgent,
      'Authorization': token,
    });

    FormData formData = FormData.fromMap({
      'npm': _npm,
      'semester': _semester,
      'tahun_akademik': _tahunAkademik,
    });

    try {
      Response response = await dio!.post(
        baseUrl + 'api/presensi/list_mk',
        options: options,
        data: formData,
      );

      if (response.statusCode != 200) throw Error();
      if (response.data.length <= 0) {
        return right(
          <DataPresensiModel>[],
        );
      }

      List<DataPresensiModel> data = List<DataPresensiModel>.from(
          response.data.map((x) => DataPresensiModel.fromJson(x)));

      log(data.toString());

      return right(data);
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
