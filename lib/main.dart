import 'package:amikom_wan/cubit/auth/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'pages/home/home_page.dart';
import 'pages/khs/khs_page.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amikom Wan',
        theme: ThemeData(
          primarySwatch: Colors.blue,
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
            default:
              return MaterialPageRoute(builder: (context) => LoginPage());
          }
        },
      ),
    );
  }
}
