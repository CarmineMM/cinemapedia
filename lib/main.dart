import 'package:cinemapedia/config/router/app_router.dart';
import 'package:cinemapedia/config/themes/app_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      showSemanticsDebugger: true,
      theme: AppTheme().getTheme(),
    );
  }
}
