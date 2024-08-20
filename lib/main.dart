import 'package:bigio_test/ui/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bigio_test/env/env.dart' as AppEnv;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        // '/search': (context) => SearchPage(),
      },
    );
  }
}

class Config {
  static const String baseUrl = kDebugMode ? AppEnv.BASE_URL : AppEnv.BASE_URL;
}
