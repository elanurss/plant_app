import 'package:flutter/material.dart';

import '../core/di/injection.dart';
import '../core/theme/app_theme.dart';
import 'router/app_router.dart';

class PlantApp extends StatefulWidget {
  const PlantApp({super.key});

  @override
  State<PlantApp> createState() => _PlantAppState();
}

class _PlantAppState extends State<PlantApp> {
  final AppRouter _router = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PlantApp',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      routerConfig: _router.config(),
    );
  }
}
