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
        'User-Agent': '@m!k0mXv=#neMob!le',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ByaW1hcnlzaWQiOiIxOS4xMS4yNzQyIiwianRpIjoiMmY5ZTE0NDMtYWRmNy00ZWM1LWFkM2MtZDZmYTkyNTFkOTBiIiwiaWF0IjoxNjUzMzIxNTUyLCJuYmYiOjE2NTMzMjE1NTIsImV4cCI6MTY1MzMzOTU1Mn0.onEkeJMN0UHAspXXjL4Fzhy9AVg-6thb3bi1qS9Qga8',
      },
    );
    print(token);
    print('https://ds.amikom.ac.id/api/amikomone/mahasiswa/$npm/ktm_digital');
    try {
      Response response = await dio!.get(
        'https://ds.amikom.ac.id/api/amikomone/mahasiswa/$npm/ktm_digital',
        options: options,
      );

      log(response.data.toString());
      if (response.statusCode != 200) throw Error();

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
