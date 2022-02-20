import 'dart:developer';

import 'package:amikom_wan/common/constant.dart';
import 'package:amikom_wan/data/model/profile/profile_model.dart';
import 'package:amikom_wan/helper/helper.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfileRepository {
  Dio? dio;
  ProfileRepository(this.dio);

  Future<Either<String, ProfileModel>> get() async {
    // access token
    var token = await Helper().getToken('access');

    // box
    var box = await Hive.openBox('app_config');

    // header
    Options options = Options(headers: {
      'User-Agent': userAgent,
      'Authorization': token,
    });

    try {
      Response response = await dio!.post(
        baseUrl + 'api/personal/init_data_mhs',
        options: options,
      );

      if (response.statusCode != 200) throw Error();

      ProfileModel data = ProfileModel.fromJson(response.data);

      box.put('semester', data.periodeAkademik!.semester);
      box.put('tahunAkademik', data.periodeAkademik!.tahunAkademik);
      box.put('profile_data', data);

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
