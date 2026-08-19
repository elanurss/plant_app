import 'package:flutter/material.dart';

import '../core/di/injection.dart';
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
      routerConfig: _router.config(),
    );
  }
}
