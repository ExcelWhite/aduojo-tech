import 'dart:ui';

import 'package:portfolio/apps/nutribot/screens/nutribot_screen.dart';
import 'package:portfolio/constants/translatables.dart';

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
      'title': Translatable(english: 'Nutribot AI', russian: 'Nutribot AI'),

      'description': Translatable(
        english: "NutriFlex AI helps you stay fit and eat better with smart,"
          " AI-generated (predefined) weekly routines. Whether you're bulking, "
          "cutting, or just maintaining, NutriFlex gives you instant access to "
          "workout plans and diet recommendations at the tap of a button — no "
          "thinking required.",
        russian: "NutriFlex AI помогает вам поддерживать форму и питаться лучше с помощью умных, "
          "сгенерированных ИИ (предопределенных) еженедельных программ. Независимо от того, "
          "набираете ли вы массу, скидываете или просто поддерживаете форму, NutriFlex предоставляет вам мгновенный доступ к "
          "планам тренировок и рекомендациям по диете одним нажатием кнопки — без необходимости "
          "размышлять.",
      ),

      'features': Translatable(
        english: "🏋️ AI-powered Workout Generator based on weekly split\n"
          "🥗 Smart Diet Plan Creator with full daily menus\n"
          "🎯 Intuitive 2-tab interface for quick access\n"
          "🧠 Designed with beginners and pros in mind",
        russian: "🏋️ Генератор тренировок на основе ИИ с еженедельным разделением \n"
          "🥗 Умный создатель диетических планов с полными ежедневными меню \n"
          "🎯 Интуитивно понятный интерфейс с 2 вкладками для быстрого доступа\n "
          "🧠 Разработано с учетом как новичков, так и профессионалов "
      )
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