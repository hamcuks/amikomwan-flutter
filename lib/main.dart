import 'dart:async';

import 'package:amikom_wan/cubit/auth/auth_cubit.dart';
import 'package:amikom_wan/cubit/gpa_summary/gpa_summary_cubit.dart';
import 'package:amikom_wan/cubit/khs/action/choose_semester/choose_semester_cubit.dart';
import 'package:amikom_wan/cubit/khs/khs_cubit.dart';
import 'package:amikom_wan/cubit/ktm/ktm_cubit.dart';
import 'package:amikom_wan/cubit/presensi/data/data_presensi_cubit.dart';
import 'package:amikom_wan/cubit/presensi/send_qr/send_qr_cubit.dart';
import 'package:amikom_wan/cubit/profile/action/profile_action_cubit.dart';
import 'package:amikom_wan/cubit/schedule/action/choose_day/choose_day_cubit.dart';
import 'package:amikom_wan/cubit/schedule/schedule_cubit.dart';
import 'package:amikom_wan/cubit/splash/splash_cubit.dart';
import 'package:amikom_wan/cubit/transkrip/transkrip_cubit.dart';
import 'package:amikom_wan/data/model/khs/akademik/akademik_model.dart';
import 'package:amikom_wan/data/model/profile/profile_model.dart';
import 'package:amikom_wan/data/model/schedule/schedule_model.dart';
import 'package:amikom_wan/data/repository/auth/auth_repository.dart';
import 'package:amikom_wan/pages/ktm/ktm_page.dart';
import 'package:amikom_wan/pages/presensi/data/data_presensi_page.dart';
import 'package:amikom_wan/pages/presensi/presensi_page.dart';
import 'package:amikom_wan/pages/presensi/presensi_result_page.dart';
import 'package:amikom_wan/pages/splash_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'cubit/khs/action/akademik/akademik_cubit.dart';
import 'cubit/profile/mahasiswa/profile_cubit.dart';
import 'pages/home/home_page.dart';
import 'pages/khs/khs_page.dart';
import 'pages/profile/profile_page.dart';
import 'pages/transkrip/transkrip_page.dart';
import 'routes.dart';
import 'package:flutter/material.dart';

import 'pages/login/login_page.dart';
import 'pages/schedule/schedule_page.dart';

void main() async {
  await Hive.initFlutter();
  registerAdapters();
  periodicTask();
  runApp(const MyApp());
}

void periodicTask() async {
  await Hive.openBox('app_config');
  var box = await Hive.openBox('credentials');

  String npm = box.get('npm');
  String password = box.get('password');

  Timer.periodic(const Duration(hours: 1), (timer) {
    AuthRepository(Dio()).login(npm, password);
    AuthRepository(Dio()).loginPresensi(npm, password);
  });
}

void registerAdapters() {
  Hive.registerAdapter(ProfileModelAdapter());
  Hive.registerAdapter(MhsAdapter());
  Hive.registerAdapter(PeriodeAkademikAdapter());
  Hive.registerAdapter(ScheduleModelAdapter());
  Hive.registerAdapter(AkademikModelAdapter());
  Hive.registerAdapter(TahunAdapter());
  Hive.registerAdapter(SemesterAdapter());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashCubit()..getCredential()),
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => ScheduleCubit()..get()),
        BlocProvider(create: (_) => ChooseDayCubit()),
        BlocProvider(create: (_) => ProfileCubit()..get()),
        BlocProvider(create: (_) => ProfileActionCubit()),
        BlocProvider(create: (_) => KhsCubit()),
        BlocProvider(create: (_) => AkademikCubit()..get()),
        BlocProvider(create: (_) => GpaSummaryCubit()),
        BlocProvider(create: (_) => ChooseSemesterCubit()),
        BlocProvider(create: (_) => TranskripCubit()),
        BlocProvider(create: (_) => KtmCubit()),
        BlocProvider(create: (_) => DataPresensiCubit()),
        BlocProvider(create: (_) => SendQrCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amikom Wan',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF3F9FE),
        ),
        initialRoute: Routes.splash,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case (Routes.splash):
              return MaterialPageRoute(
                builder: (context) => const SplashPage(),
              );
            case (Routes.login):
              return MaterialPageRoute(
                builder: (context) => LoginPage(),
              );
            case (Routes.home):
              return MaterialPageRoute(
                builder: (context) => const HomePage(),
              );
            case (Routes.schedule):
              return MaterialPageRoute(
                builder: (context) => SchedulePage(),
              );
            case (Routes.dataPresensi):
              return MaterialPageRoute(
                builder: (context) => const DataPresensiPage(),
              );
            case (Routes.khs):
              return MaterialPageRoute(
                builder: (context) => KHSPage(),
              );
            case (Routes.transkrip):
              return MaterialPageRoute(
                builder: (context) => const TranskripPage(),
              );
            case (Routes.ktm):
              return MaterialPageRoute(
                builder: (context) => KTMPage(),
              );
            case (Routes.profile):
              return MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              );
            case (Routes.scanQr):
              return MaterialPageRoute(
                builder: (context) => const PresensiPage(),
              );
            case (Routes.presensiResult):
              return MaterialPageRoute(
                builder: (context) => const PresensiResultPage(),
              );
            default:
              return MaterialPageRoute(
                builder: (context) => LoginPage(),
              );
          }
        },
      ),
    );
  }
}
