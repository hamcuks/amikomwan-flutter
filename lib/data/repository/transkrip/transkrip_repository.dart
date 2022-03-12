part of '../repositories.dart';

class TranskripRepository {
  Dio? dio;

  TranskripRepository(this.dio);

  Future<Either<String, TranskripModel>> get(String npm) async {
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

    FormData data = FormData.fromMap({
      'npm': npm,
    });

    try {
      Response response = await dio!.post(
        baseUrl + 'api/krs/transkrip',
        options: options,
        data: data,
      );

      if (response.statusCode != 200) throw Error();

      log(response.data.toString());

      return right(TranskripModel.fromJson(response.data));
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
