import 'package:flutter/material.dart';
import 'package:newbie/data/local/app_shared_preferences.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  bool _isLightMode = false;

  late AppSharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    sharedPreferences = AppSharedPreferences();
    _loadThemeMode(); // Asynchronous work done separately
  }

  Future<void> _loadThemeMode() async {
    bool? lightMode = await sharedPreferences.getBoolean(AppSharedPreferences.isLightMode) ?? false;
    setState(() {
      _isLightMode = lightMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: _isLightMode ? ThemeMode.light : ThemeMode.dark,
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: updateThemeMode,
            child: const Text('Change mode'),
          ),
        ),
      ),
    );
  }

  void updateThemeMode() {
    setState(() {
      _isLightMode = !_isLightMode;
    });
    sharedPreferences.setBoolean(AppSharedPreferences.isLightMode, _isLightMode);
  }
}
