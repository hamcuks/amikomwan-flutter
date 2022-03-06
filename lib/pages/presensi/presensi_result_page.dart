import '../../cubit/presensi/send_qr/send_qr_cubit.dart';
import '../../routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class PresensiResultPage extends StatelessWidget {
  const PresensiResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: BlocConsumer<SendQrCubit, SendQrState>(
          listener: (context, state) {
            if (state is SendQrSuccess || state is SendQrError) {
              Future.delayed(const Duration(seconds: 5), () {
                Navigator.of(context).pushReplacementNamed(Routes.home);
              });
            }
          },
          builder: (context, state) {
            if (state is SendQrSuccess) {
              return _buildSuccess(context);
            } else if (state is SendQrError) {
              if (state.statusCode == 400) {
                return _buildFailed(context);
              } else {
                return _buildWarning(context);
              }
            } else {
              return _buildLoading(context);
            }
          },
        ),
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
          width: MediaQuery.of(context).size.width * 0.6,
          child: const Text(
            'Waduh. Kalo udah presensi, gaperlu presensi lagi bor!',
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
          width: MediaQuery.of(context).size.width * 0.6,
          child: const Text(
            'Walah, gagal presensinya bor. Coba diulang ya!',
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
          width: MediaQuery.of(context).size.width * 0.6,
          child: const Text(
            'Yeayy, Berhasil presensi bor!. Jangan diskip kuliahnya ya!',
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
