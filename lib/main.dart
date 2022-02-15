import 'package:amikom_wan/pages/home/home_page.dart';
import 'package:amikom_wan/routes.dart';
import 'package:flutter/material.dart';

import 'pages/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          default:
            return MaterialPageRoute(builder: (context) => LoginPage());
        }
      },
    );
  }
}
