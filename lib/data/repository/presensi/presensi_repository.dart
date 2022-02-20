// import 'dart:developer';

// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';

// class PresensiRepository {
//   Dio? dio;

//   PresensiRepository(this.dio);

//   Future<Either<String, void>> presensi(String code, String npm) async {
//     try {} on DioError catch (e) {
//       log(e.message);

//       switch (e.type) {
//         case DioErrorType.connectTimeout:
//           return left('Gagal Login, Pastikan Terkoneksi ke Internet');
//         case DioErrorType.response:
//           return left('Gagal Login, Pastikan NIM dan Password Benar');
//         default:
//           return left(e.message);
//       }
//     }
//   }
// }
