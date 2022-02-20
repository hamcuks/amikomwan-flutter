import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PresensiResultPage extends StatelessWidget {
  const PresensiResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: _buildSuccess(context),
      ),
    );
  }

  Column _buildWarning(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/json/warning.json',
          width: 150,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: const Text(
            'Maaf, Kamu sudah melakukan presensi sebelumnya',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }

  Column _buildFailed(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/json/error.json',
          width: 150,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: const Text(
            'Yahhh, gagal presensi. Silahkan coba lagi ya!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }

  Column _buildSuccess(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/json/success.json',
          width: 150,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: const Text(
            'Yeayy, Berhasil presensi. Selamat mengikuti perkuliahan!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }

  Center _buildLoading(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/json/loading.json',
        width: 250,
      ),
    );
  }
}
