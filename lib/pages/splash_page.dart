import 'package:amikom_wan/cubit/splash/splash_cubit.dart';
import 'package:amikom_wan/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashSuccess) {
            print(state.isLoggedIn);
            Future.delayed(const Duration(milliseconds: 500), () {
              if (!state.isLoggedIn) {
                Navigator.pushReplacementNamed(context, Routes.login);
              } else {
                Navigator.pushReplacementNamed(context, Routes.home);
              }
            });
          }
        },
        builder: (context, state) {
          return Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/amikom-logo.png'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
