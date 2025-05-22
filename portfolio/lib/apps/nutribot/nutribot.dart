import 'dart:ui';

import 'package:portfolio/apps/nutribot/screens/nutribot_screen.dart';

import '../apps.dart';

class Nutribot extends Apps {
  final Size size;

  Nutribot(this.size){
    setInitialScreenKey();
    initializeAppDetails();
    initializeAppScreens();
  }

  @override
  void initializeAppDetails() {
    appDetails = {
      'title': 'Nutribot',

      'description': "NutriFlex AI helps you stay fit and eat better with smart,"
          " AI-generated (predefined) weekly routines. Whether you're bulking, "
          "cutting, or just maintaining, NutriFlex gives you instant access to "
          "workout plans and diet recommendations at the tap of a button — no "
          "thinking required.",

      'features': "🏋️ AI-powered Workout Generator based on weekly split"
                  "🥗 Smart Diet Plan Creator with full daily menus"
                  "🎯 Intuitive 2-tab interface for quick access"
                  "🧠 Designed with beginners and pros in mind"
    };
  }

  @override
  void initializeAppScreens() {
    appScreens = {
      'nutribot': (onNavigate, onPop) => NutribotScreen(
          onNavigate: onNavigate,
          onPop: onPop,
          size: size
      )
    };
  }

  @override
  void setInitialScreenKey() {
    initialScreenKey = 'nutribot';
  }


}

class NutribotColors {
  static final white = Color(0xFFF5F5F5);
  static final blue = Color(0xFF4169E1);
  static final black = Color(0xFF333333);
}