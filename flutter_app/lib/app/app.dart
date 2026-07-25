import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

import 'router.dart';


class SentinelAIApp extends StatelessWidget {
  const SentinelAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SentinelAI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: appRouter,
    );
  }
}