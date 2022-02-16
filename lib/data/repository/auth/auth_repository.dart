import 'package:amikom_wan/common/constant.dart';
import 'package:amikom_wan/data/model/auth/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  Dio? dio;
  AuthRepository(this.dio);

  Future<Either<String, LoginModel>> login(String npm, String password) async {
    // header
    Options options =
        Options(contentType: Headers.formUrlEncodedContentType, headers: {
      'User-Agent': userAgent,
    });

    FormData data = FormData.fromMap({
      'username': npm,
      'keyword': password,
    });

    try {
      Response response = await dio!.post(
        baseUrl + 'login',
        options: options,
        data: data,
      );

      if (response.statusCode != 200) throw Error();

      return right(LoginModel.fromJson(response.data));
    } on DioError catch (e) {
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
