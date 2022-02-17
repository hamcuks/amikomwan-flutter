import 'package:amikom_wan/cubit/auth/auth_cubit.dart';
import 'package:amikom_wan/cubit/khs/khs_cubit.dart';
import 'package:amikom_wan/cubit/profile/action/profile_action_cubit.dart';
import 'package:amikom_wan/cubit/schedule/schedule_cubit.dart';
import 'package:amikom_wan/cubit/transkrip/transkrip_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => ScheduleCubit()..get()),
        BlocProvider(create: (_) => ProfileCubit()..get()),
        BlocProvider(create: (_) => ProfileActionCubit()),
        BlocProvider(create: (_) => KhsCubit()..get()),
        BlocProvider(create: (_) => TranskripCubit()..get()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amikom Wan',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF3F9FE),
        ),
        initialRoute: Routes.login,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case (Routes.login):
              return MaterialPageRoute(builder: (context) => LoginPage());
            case (Routes.home):
              return MaterialPageRoute(builder: (context) => HomePage());
            case (Routes.schedule):
              return MaterialPageRoute(builder: (context) => SchedulePage());
            case (Routes.khs):
              return MaterialPageRoute(builder: (context) => const KHSPage());
            case (Routes.transkrip):
              return MaterialPageRoute(
                  builder: (context) => const TranskripPage());
            case (Routes.profile):
              return MaterialPageRoute(
                  builder: (context) => const ProfilePage());
            default:
              return MaterialPageRoute(builder: (context) => LoginPage());
          }
        },
      ),
    );
  }
}
