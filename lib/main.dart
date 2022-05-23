import 'dart:async';

import 'pages/pages.dart';
import 'package:dio/dio.dart';

import 'cubit/auth/auth_cubit.dart';
import 'cubit/gpa_summary/gpa_summary_cubit.dart';
import 'cubit/khs/action/choose_semester/choose_semester_cubit.dart';
import 'cubit/khs/khs_cubit.dart';
import 'cubit/ktm/ktm_cubit.dart';
import 'cubit/presensi/data/data_presensi_cubit.dart';
import 'cubit/presensi/send_qr/send_qr_cubit.dart';
import 'cubit/profile/action/profile_action_cubit.dart';
import 'cubit/schedule/action/choose_day/choose_day_cubit.dart';
import 'cubit/schedule/schedule_cubit.dart';
import 'cubit/splash/splash_cubit.dart';
import 'cubit/transkrip/transkrip_cubit.dart';
import 'data/model/models.dart';
import 'data/repository/repositories.dart';
import 'pages/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'cubit/khs/action/akademik/akademik_cubit.dart';
import 'cubit/profile/mahasiswa/profile_cubit.dart';
import 'routes.dart';
import 'package:flutter/material.dart';

void main() async {
  await Hive.initFlutter();
  registerAdapters();
  periodicTask();
  runApp(const MyApp());
}

void periodicTask() async {
  await Hive.openBox('app_config');
  var box = await Hive.openBox('credentials');

  var npm = box.get('npm');
  var password = box.get('password');

  if (npm != null && password != null) {
    Timer.periodic(const Duration(hours: 1), (timer) {
      AuthRepository(Dio()).login(npm, password);
      AuthRepository(Dio()).loginPresensi(npm, password);
    });
  }
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
        BlocProvider(create: (_) => ScheduleCubit()),
        BlocProvider(create: (_) => ChooseDayCubit()),
        BlocProvider(create: (_) => ProfileCubit()),
        BlocProvider(create: (_) => ProfileActionCubit()),
        BlocProvider(create: (_) => KhsCubit()),
        BlocProvider(create: (_) => AkademikCubit()),
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
                builder: (context) => const SchedulePage(),
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
                builder: (context) => const KTMPage(),
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
