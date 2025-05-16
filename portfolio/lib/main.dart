import 'package:flutter/material.dart';
import 'package:portfolio/screens/main_screen.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ADUOJO.TECH',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
