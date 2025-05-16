
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Translatable {
  final String english;
  final String russian;

  Translatable({required this.english, required this.russian});
}

final Map<String, Translatable> mainScreenTranslatableTexts = {
  'introText': Translatable(
      english: "Hello and welcome to my showroom! I'm Enefu Elisha Aduojo, "
          "a Flutter frontend and mobile app developer with two years worth of "
          "experience in collaborations on innovative projects and real world integrations."
          " With a background in computer science and engineering, I enjoy transforming creative ideas into "
          "dynamic applications.",
      russian: 'Здравствуйте и добро пожаловать в мое шоу-рум! Я Энефу Элиша Адуоджо, '
          'разработчик фронтенда на Flutter и мобильных приложений с двухлетним опытом '
          'сотрудничества над инновационными проектами и реальными интеграциями. '
          'Имея образование в области компьютерных наук и инженерии, мне нравится '
          'превращать креативные идеи в динамичные приложения.',
  ),
};

final List<dynamic> experienceResumeEntries = [
  {
    'text': Translatable(
    english: 'Flutter developer intern at COSM Labs, ITMO University, December, 2024 - till date',
    russian: 'Стажёр Flutter-разработчик в COSM Labs, ИТМО, декабрь 2024 - по настоящее время'
    ),
    'icon': FontAwesomeIcons.circleCheck
  },
  {
    'text': Translatable(
    english: 'Flutter developer, at Caldoc Systems December, 2023 - June 2024',
    russian: 'Flutter-разработчик в Caldoc Systems, декабрь 2023 - июнь 2024'
    ),
    'icon': FontAwesomeIcons.circleCheck
  },
];

final List<dynamic> expertiseResumeTranslatableTexts = [
  {
    'text': Translatable(
      english: 'Firebase Integration',
      russian: 'Интеграция Firebase',
    ),
    'icon': FontAwesomeIcons.circleCheck
  },
  {
    'text': Translatable(
      english: 'Provider, Bloc, Riverpod state management',
      russian: 'Управление состоянием с помощью Provider, Bloc, Riverpod',
    ),
    'icon': FontAwesomeIcons.circleCheck
  },
  {
    'text': Translatable(
      english: 'GoRouter, Navigator 2.0 navigation e.t.c',
      russian: 'Навигация с помощью GoRouter, Navigator 2.0 и т.д.',
    ),
    'icon': FontAwesomeIcons.circleCheck
  },
  {
    'text': Translatable(
      english: 'RESTful API and 3rd party integrations',
      russian: 'RESTful API и интеграции с третьими сторонами',
    ),
    'icon': FontAwesomeIcons.circleCheck
  },
  {
    'text': Translatable(
      english: 'Flutter mobile and web',
      russian: 'Flutter для мобильных и веб-приложений',
    ),
    'icon': FontAwesomeIcons.circleCheck
  },
  {
    'text': Translatable(
      english: 'Flutter Testing',
      russian: 'Тестирование Flutter',
    ),
    'icon': FontAwesomeIcons.circleCheck
  },
  {
    'text': Translatable(
      english: 'Data Modeling and Optimization',
      russian: 'Моделирование данных и оптимизация',
    ),
    'icon': FontAwesomeIcons.circleCheck
  },
  {
    'text': Translatable(
      english: 'CI/CD',
      russian: 'CI/CD',
    ),
    'icon': FontAwesomeIcons.circleCheck
  },
  {
    'text': Translatable(
      english: 'Community Engagements',
      russian: 'Участие в сообществе',
    ),
    'icon': FontAwesomeIcons.circleCheck
  },
  {
    'text': Translatable(
      english: 'Performance optimization',
      russian: 'Оптимизация производительности',
    ),
    'icon': FontAwesomeIcons.circleCheck
  },
  {
    'text': Translatable(
      english: 'Animations and Widgets Optimization',
      russian: 'Анимация и Оптимизация виджетов',
    ),
    'icon': FontAwesomeIcons.circleCheck
  },
];

final Map<String, Translatable> qualitiesResumeTranslatableTexts = {
  'title': Translatable(english: 'Personal qualities', russian: 'Личные качества'),
  'entry1': Translatable(english: 'Problem-Solving Skills', russian: 'Навыки решения проблем'),
  'entry2': Translatable(english: 'Strong Communication Skills', russian: 'Сильные коммуникативные навыки'),
  'entry3': Translatable(english: 'Time Management', russian: 'Управление временем'),
  'entry4': Translatable(english: 'Adaptability', russian: 'Адаптивность'),
  'entry5': Translatable(english: 'Attention to Details', russian: 'Внимание к деталям'),
  'entry6': Translatable(english: 'Team Collaboration', russian: 'Командное сотрудничество'),
  'entry7': Translatable(english: 'Creativity', russian: 'Креативность'),
};

final Map<String, Translatable> educationResumeTranslatableTexts = {
  'title': Translatable(english: 'Education', russian: 'Образование'),
  'entry1': Translatable(english: 'B.Sc Informatics and Computer Engineering, ITMO University, St. Petersburg', russian: 'Бакалавр информатики и компьютерной инженерии, ИТМО, Санкт-Петербург'),
  'entry2': Translatable(english: 'September 2021 - May 2025', russian: 'Сентябрь 2021 - Май 2025'),
};

final Map<String, Translatable> moreCoreResumeTranslatableTexts = {
  'title': Translatable(english: 'More Core Skills', russian: ''),
  'entry1': Translatable(english: 'Java', russian: ''),
  'entry2': Translatable(english: 'JavaScript', russian: ''),
  'entry3': Translatable(english: 'NodeJS', russian: ''),
  'entry4': Translatable(english: 'Python', russian: ''),
  'entry5': Translatable(english: 'Backend Solutions', russian: ''),
  'entry6': Translatable(english: 'Figma', russian: ''),
  'entry7': Translatable(english: 'Git', russian: ''),
  'entry8': Translatable(english: 'SQL', russian: ''),
};