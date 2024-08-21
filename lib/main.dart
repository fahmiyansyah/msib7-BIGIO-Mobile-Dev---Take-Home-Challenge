import 'package:bigio_test/data/cubits/characters/fetch_characters_cubit.dart';
import 'package:bigio_test/data/cubits/detail_character/character_detail_cubit.dart';
import 'package:bigio_test/ui/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bigio_test/env/env.dart' as AppEnv;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<FetchCharactersCubit>(
          create: (context) => FetchCharactersCubit(),
        ),
        BlocProvider<CharacterDetailCubit>(
          create: (context) => CharacterDetailCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
