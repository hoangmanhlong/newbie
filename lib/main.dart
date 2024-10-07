import 'package:flutter/material.dart';
import 'package:newbie/pages/home.dart';
import 'package:newbie/pages/test.dart';
import 'package:newbie/utils/app_res.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppRes.appThemeData,
      home: Test(),
    );
  }
}


