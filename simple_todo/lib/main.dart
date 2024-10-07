import 'package:flutter/material.dart';
import 'package:simple_todo/components/splash.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Todo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.greenAccent,
          ),
          useMaterial3: true,
          snackBarTheme: const SnackBarThemeData(
            showCloseIcon: true,
            behavior: SnackBarBehavior.floating,
          )),
      darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.greenAccent, brightness: Brightness.dark),
          brightness: Brightness.dark,
          useMaterial3: true,
          snackBarTheme: const SnackBarThemeData(
            showCloseIcon: true,
            behavior: SnackBarBehavior.floating,
          )),
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
