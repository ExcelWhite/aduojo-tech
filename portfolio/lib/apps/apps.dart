import 'package:flutter/material.dart';

abstract class Apps {
  // App metadata
  Map<String, String> appDetails = {};
  String initialScreenKey = '';

  // KEY FIX: Map screenKey -> screen builder
  // Map<String, Widget Function(void Function(String))> appScreens = {};
  Map<String, Widget Function(void Function(String) onNavigate, void Function() onPop)> appScreens = {};


  void initializeAppDetails();
  void initializeAppScreens();
  void setInitialScreenKey();
}
