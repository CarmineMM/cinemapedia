import 'package:cinemapedia/config/router/app_router.dart';
import 'package:cinemapedia/config/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Cinemapedia',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: true,
      // showSemanticsDebugger: true,
      theme: AppTheme().getTheme(),
    );
  }
}
