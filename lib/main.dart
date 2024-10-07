import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static const home = '/';
  static const detail = '/detail';
}

final GoRouter _router = GoRouter(initialLocation: AppRoute.home, routes: [
  GoRoute(path: AppRoute.home, builder: (context, state) => Home()),
  GoRoute(path: AppRoute.detail, builder: (context, state) => Detail())
]);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.push(AppRoute.detail),
          child: const Text('Go detail'),
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.pop(),
          child: const Text('Go Home'),
        ),
      ),
    );
  }
}
