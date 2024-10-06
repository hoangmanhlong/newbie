import 'package:flutter/material.dart';
import 'package:newbie/screens/login/login.dart';
import 'package:newbie/screens/login/login_get_started.dart';
import 'package:newbie/screens/login/login_intro.dart';
import 'package:newbie/screens/routes.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        AppRoute.home: (context) => LoginStarted(),
        AppRoute.login: (context) => LoginIntro(),
      },
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF53B175)),
          useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
