import 'package:amikom_wan/cubit/auth/auth_cubit.dart';
import 'package:amikom_wan/cubit/splash/splash_cubit.dart';
import 'package:amikom_wan/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) async {
          var box = await Hive.openBox('credentials');
          if (state is SplashSuccess) {
            Future.delayed(const Duration(milliseconds: 3000), () {
              if (!state.isLoggedIn) {
                Navigator.pushReplacementNamed(context, Routes.login);
              } else {
                String npm = box.get('npm');
                String password = box.get('password');

                context.read<AuthCubit>().login(npm, password);

                Navigator.pushReplacementNamed(context, Routes.home);
              }
            });
          }
        },
        builder: (context, state) {
          return SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 96,
                  height: 96,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/amikom-logo.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Lottie.asset('assets/json/loading.json', width: 150),
              ],
            ),
          );
        },
      ),
    );
  }
}
