import 'package:portfolio/apps/kiddiegram/screens/kiddiegram_screen.dart';

import '../../constants/translatables.dart';
import '../apps.dart';
import 'dart:ui';


class Kiddiegram extends Apps {
  final Size size;

  Kiddiegram(this.size){
    setInitialScreenKey();
    initializeAppDetails();
    initializeAppScreens();
  }


  @override
  void initializeAppDetails() {
    appDetails = {
      'title': Translatable(english: 'Kiddiegram', russian: 'Kiddiegram'),

      'description': Translatable(
        english: "Ever thought of a social media platform that's safe for kids? \n"
            "Kiddiegram, a social media platform designed for kids to share their "
            "experiences, photos and videos with their family and friends.",
        russian: "Вы когда-нибудь задумывались о платформе социальных сетей, которая "
            "была бы безопасна для детей? \n"
            "Kiddiegram - это платформа социальных сетей, предназначенная для того, "
            "чтобы дети могли делиться своими впечатлениями, фотографиями и видео "
            "со своей семьей и друзьями.",
      ),

      'features': Translatable(
          english: "# Flutter for Frontend\n"
              "# Appwrite for Backend\n"
              "# Appwrite for Database\n"
              "# Secure signup and authentication using Appwrite\n"
              "# Profile creation and management\n"
              "# Profile Management\n"
              "# Real-time access to database\n"
              "# Post, Feed and like system\n"
              "# Search system\n"
              "# Notification system\n"
              "# Custom Themes",
          russian: "# Flutter для фронтенда\n"
              "# Appwrite для бэкенда\n"
              "# Appwrite для базы данных\n"
              "# Безопасная регистрация и аутентификация с использованием Appwrite\n"
              "# Создание и управление профилем\n"
              "# Управление профилем\n"
              "# Доступ к базе данных в режиме реального времени\n"
              "# Система публикаций, ленты и лайков\n"
              "# Система поиска\n"
              "# Система уведомлений\n"
              "# Кастомные темы"
      )
    };
  }

  @override
  void initializeAppScreens() {
    appScreens = {
      'kiddiegram': (onNavigate, onPop) => KiddiegramScreen(
          onNavigate: onNavigate,
          onPop: onPop,
          size: size
      )
    };
  }

  @override
  void setInitialScreenKey() {
    initialScreenKey = 'kiddiegram';
  }

}