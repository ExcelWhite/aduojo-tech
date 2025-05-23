
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
    'icon': FontAwesomeIcons.userGraduate
  },
  {
    'text': Translatable(
    english: 'Flutter developer, at Caldoc Systems December, 2023 - June 2024',
    russian: 'Flutter-разработчик в Caldoc Systems, декабрь 2023 - июнь 2024'
    ),
    'icon': FontAwesomeIcons.laptopCode
  },
];

final List<dynamic> expertiseResumeEntries = [
  {
    'text': Translatable(
      english: 'Firebase Integration',
      russian: 'Интеграция Firebase',
    ),
    'icon': FontAwesomeIcons.fire
  },
  {
    'text': Translatable(
      english: 'Provider, Bloc, Riverpod state management',
      russian: 'Управление состоянием с помощью Provider, Bloc, Riverpod',
    ),
    'icon': FontAwesomeIcons.codeBranch
  },
  {
    'text': Translatable(
      english: 'GoRouter, Navigator 2.0 navigation e.t.c',
      russian: 'Навигация с помощью GoRouter, Navigator 2.0 и т.д.',
    ),
    'icon': FontAwesomeIcons.route
  },
  {
    'text': Translatable(
      english: 'RESTful API and 3rd party integrations',
      russian: 'RESTful API и интеграции с третьими сторонами',
    ),
    'icon': FontAwesomeIcons.plug
  },
  {
    'text': Translatable(
      english: 'Flutter mobile and web',
      russian: 'Flutter для мобильных и веб-приложений',
    ),
    'icon': FontAwesomeIcons.mobileScreenButton
  },
  {
    'text': Translatable(
      english: 'Flutter Testing',
      russian: 'Тестирование Flutter',
    ),
    'icon': FontAwesomeIcons.vial
  },
  {
    'text': Translatable(
      english: 'Data Modeling and Optimization',
      russian: 'Моделирование данных и оптимизация',
    ),
    'icon': FontAwesomeIcons.database
  },
  {
    'text': Translatable(
      english: 'CI/CD',
      russian: 'CI/CD',
    ),
    'icon': FontAwesomeIcons.arrowsRotate
  },
  {
    'text': Translatable(
      english: 'Community Engagements',
      russian: 'Участие в сообществе',
    ),
    'icon': FontAwesomeIcons.users
  },
  {
    'text': Translatable(
      english: 'Performance optimization',
      russian: 'Оптимизация производительности',
    ),
    'icon': FontAwesomeIcons.gaugeHigh
  },
  {
    'text': Translatable(
      english: 'Animations and Widgets Optimization',
      russian: 'Анимация и Оптимизация виджетов',
    ),
    'icon': FontAwesomeIcons.wandMagicSparkles
  },
];

final List<dynamic> qualitiesResumeEntries = [
  {
    'text': Translatable(english: 'Problem-Solving Skills', russian: 'Навыки решения проблем'),
    'icon': FontAwesomeIcons.lightbulb
  },
  {
    'text': Translatable(english: 'Strong Communication Skills', russian: 'Сильные коммуникативные навыки'),
    'icon': FontAwesomeIcons.commentDots
  },
  {
    'text': Translatable(english: 'Time Management', russian: 'Управление временем'),
    'icon': FontAwesomeIcons.clock
  },
  {
    'text': Translatable(english: 'Adaptability', russian: 'Адаптивность'),
    'icon': FontAwesomeIcons.shuffle
  },
  {
    'text': Translatable(english: 'Attention to Details', russian: 'Внимание к деталям'),
    'icon': FontAwesomeIcons.eye
  },
  {
    'text': Translatable(english: 'Team Collaboration', russian: 'Командное сотрудничество'),
    'icon': FontAwesomeIcons.peopleGroup
  },
  {
    'text': Translatable(english: 'Creativity', russian: 'Креативность'),
    'icon': FontAwesomeIcons.paintbrush
  }
];

final List<dynamic> educationResumeEntries = [
  {
    'text': Translatable(
      english: 'B.Sc Computer Science and Engineering',
        russian: 'Бакалавр Информатика и Вычислительная Техника'
    ),
    'icon': FontAwesomeIcons.graduationCap
  },
  {
    'text': Translatable(
      english: 'ITMO University, St. Petersburg',
        russian: 'Университет ИТМО'
    ),
    'icon': FontAwesomeIcons.school
  },
  {
    'text': Translatable(
      english: 'September 2021 - June 2025',
        russian: 'Сентябрь 2021 - Июнь 2025'
    ),
    'icon': FontAwesomeIcons.calendarDays
  },
];

final List<dynamic> moreCoreSkillsResumeEntries = [
  {
    'text': Translatable(english: 'Java, JS, NodeJS, Python, C, SQL', russian: 'Java, JS, NodeJS, Python, C, SQL'),
    'icon': FontAwesomeIcons.code
  },
  {
    'text': Translatable(
        english: 'Backend Solutions, Project Management, Figma, Git',
        russian: 'Бэкэнд решения, Управление проектами, Figma, Git'
    ),
    'icon': FontAwesomeIcons.toolbox
  },
];