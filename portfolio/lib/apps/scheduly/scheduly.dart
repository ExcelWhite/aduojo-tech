import 'package:portfolio/apps/kiddiegram/screens/kiddiegram_screen.dart';

import '../../constants/translatables.dart';
import '../apps.dart';
import 'dart:ui';


class Scheduly extends Apps {
  final Size size;

  Scheduly(this.size){
    setInitialScreenKey();
    initializeAppDetails();
    initializeAppScreens();
  }


  @override
  void initializeAppDetails() {
    appDetails = {
      'title': Translatable(english: 'Scheduly', russian: 'Scheduly'),

      'description': Translatable(
        english: "Scheduly is a CRUD flutter mobile app in which you can arrange "
            "your schedules reflecting your day to day activities.\n"
            "Scheduly is designed to be your personal assistant. The code shows "
            "an excellent way of dynamically handling model data while using "
            "complicated and fascinating widgets. It is aimed to be personalised"
            " and upcoming updates include custom themes, notifications and tunes.",
        russian: "Scheduly - это мобильное приложение CRUD flutter, в котором вы"
            " можете составлять свои расписания, отражающие вашу повседневную деятельность.\n"
            "Scheduly создан в качестве вашего личного помощника. В коде показан"
            " отличный способ динамической обработки данных модели с использованием "
            "сложных и увлекательных виджетов. Он предназначен для персонализации, "
            "и предстоящие обновления включают в себя пользовательские темы, "
            "уведомления и мелодии.",
      ),

      'features': Translatable(
          english: "# Flutter for Frontend\n"
              "# Appwrite for Backend\n"
              "# Appwrite for Database\n"
              "# Dynamic model handling\n"
              "# CRUD system \n"
              "# Themes",
          russian: "# Flutter для фронтенда\n"
              "# Appwrite для бэкенда\n"
              "# Appwrite для базы данных\n"
              "# Обработка динамической модели\n"
              "# CRUD-система\n"
              "# Темная тема"
      )
    };
  }

  @override
  void initializeAppScreens() {
    appScreens = {
      'scheduly': (onNavigate, onPop) => KiddiegramScreen(
          onNavigate: onNavigate,
          onPop: onPop,
          size: size
      )
    };
  }

  @override
  void setInitialScreenKey() {
    initialScreenKey = 'scheduly';
  }

}