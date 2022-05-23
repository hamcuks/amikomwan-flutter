part of '../repositories.dart';

class KtmRepository {
  final Dio? dio;

  const KtmRepository(this.dio);

  Future<Either<String, KtmModel>> get(String npm) async {
    // access token
    var token = await Helper().getToken('access2');

    // open hive box
    var box = await Hive.openBox('app_config');

    // header
    Options options = Options(
      contentType: Headers.formUrlEncodedContentType,
      headers: {
        'User-Agent': userAgent,
        'Authorization': 'Bearer $token',
      },
    );
    print(token);
    try {
      Response response = await dio!.get(
        'https://ds.amikom.ac.id/api/amikomone/mahasiswa/$npm/ktm_digital?lang_id=id',
        options: options,
      );

      if (response.statusCode != 200) throw Error();

      log(response.data.toString());

      KtmModel data = KtmModel.fromJson(response.data);

      box.put('ktmImage', data.result!.hash);
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
