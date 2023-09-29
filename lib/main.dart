import 'package:diet_plan/common/theme.dart';
import 'package:diet_plan/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diet Plan App',
      theme: ThemeData(
        fontFamily: 'Journal',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: primaryColor,
          onPrimary: onPrimary,
          secondary: secondryColor,
          surface: textColor,
          secondaryContainer: secondryColor,
          onSurface: Colors.white,
          onBackground: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
