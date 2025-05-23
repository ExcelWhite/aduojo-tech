import 'package:flutter/material.dart';
import 'package:portfolio/constants/translatables.dart';

abstract class Apps {
  // App metadata
  Map<String, Translatable> appDetails = {};
  String initialScreenKey = '';

  // KEY FIX: Map screenKey -> screen builder
  // Map<String, Widget Function(void Function(String))> appScreens = {};
  Map<String, Widget Function(void Function(String) onNavigate, void Function() onPop)> appScreens = {};


  void initializeAppDetails();
  void initializeAppScreens();
  void setInitialScreenKey();
}
