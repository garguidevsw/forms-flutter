import 'package:flutter/material.dart';
import 'package:formapp/config/router/app_router.dart';
import 'package:formapp/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      title: 'Form App',
      theme: AppTheme().getTheme(),
    );
  }
}
