import 'package:flutter/material.dart';
import 'package:portfolio/apps/volt_valut/screens/linked_accounts_screen.dart';
import 'package:portfolio/apps/volt_valut/screens/vault_overview_screen.dart';

import '../../constants/translatables.dart';
import '../apps.dart';

class VoltVault extends Apps {
  final Size size;

  VoltVault(this.size){
    setInitialScreenKey();
    initializeAppDetails();
    initializeAppScreens();
  }

  @override
  void initializeAppDetails() {
    appDetails = {
      'title': Translatable(english: 'VoltVault', russian: 'VoltVault'),

      'description': Translatable(
        english: "VoltVault is a next-generation mobile application designed"
          " to seamlessly bridge the gap between cryptocurrency and traditional "
          "banking. It empowers users to manage, transfer, and convert funds between"
          " their crypto assets and fiat bank cards—all within a secure, unified ecosystem.\n"
          "Unlike typical crypto wallets or banking apps, VoltVault is both: it’s a "
          "dual-wallet platform where both your crypto account and your bank card are"
          " managed by VoltVault, eliminating the need for third-party services or "
          "complicated wallet integrations.\n "
          "The app targets modern users who need fast, reliable, and transparent control"
          " over their digital and real-world finances, enabling real-time currency "
          "bridging, intuitive visualizations, and enterprise-grade security.",

        russian: "VoltVault — это мобильное приложение нового поколения, "
          "созданное для бесшовного соединения криптовалюты и традиционного "
          "банкинга. Оно позволяет пользователям управлять, переводить и конвертировать средства между "
          "своими криптоактивами и фиатными банковскими картами — всё это в рамках безопасной, единой экосистемы.\n"
          "В отличие от типичных криптокошельков или банковских приложений, VoltVault является и тем, и другим: это "
          "двойная платформа для кошельков, где как ваш криптоаккаунт, так и ваша банковская карта "
          "управляются VoltVault, устраняя необходимость в сторонних сервисах или "
          "сложных интеграциях кошельков.\n"
          "Приложение нацелено на современных пользователей, которым нужен быстрый, надежный и прозрачный контроль "
          "над своими цифровыми и реальными финансами, позволяя осуществлять мгновенное "
          "перевод валют, интуитивные визуализации и безопасность уровня предприятия."
      ),

      'features': Translatable(
        english: "🌟 Core Features\n"
          "🔄 Unified Dashboard \n "
            "Real-time total balance across crypto and fiat \n"
            "Clean separation of crypto and card balances \n"
            "Quick access to send, receive, convert, and withdraw options \n"
          "💱 Crypto <=> Fiat Bridge \n"
            "Instantly convert crypto to fiat and vice versa \n"
            "Transparent conversion rates and minimal fees \n"
            "Previews and confirmations with security checks \n"
          "💳 VoltVault Card \n"
            "Manage virtual and physical VoltVault debit cards \n"
            "Set spend limits, freeze/unfreeze, or request a new card \n"
            "View fiat transaction history in a traditional bank-style interface \n"
          "🪙 Crypto Wallets \n"
            "Support for major coins (BTC, ETH, USDT, etc.) \n"
            "QR code receiving, external transfer in/out \n"
            "Transaction and fee preview for each operation \n"
          "📊 Analytics & History \n"
            "Visual breakdown of assets (pie, bar charts) \n"
            "Historical data on transfers and conversions \n"
            "Monthly activity summaries with smart insights \n"
          "🔐 Security & Privacy \n"
            "Biometric login (FaceID/Fingerprint) \n"
            "2FA and device-based authentication \n"
            "Transaction verification prompts \n"
          "🧠 Smart Features \n"
            "Save bridge operations as templates \n"
            "Auto-convert when threshold is reached (e.g., auto-sell BTC if it hits \$60k) \n"
            "Vault Lock – goal-based crypto savings with a timer or unlock conditions \n"
          "🛟 User Support & Onboarding \n"
            "Seamless onboarding with KYC integration \n"
            "In-app support chat, ticket system, and FAQs \n"
            "Educational walkthroughs for crypto beginners \n",
        russian: "Баланс в реальном времени по криптовалюте и фиатным средствам \n"
            "Чистое разделение балансов криптовалюты и карты \n"
            "Быстрый доступ к опциям отправки, получения, конвертации и вывода средств \n"
            "💱 Крипто <=> Фиатный мост \n"
            "Мгновенная конвертация криптовалюты в фиат и наоборот \n"
            "Прозрачные курсы конвертации и минимальные комиссии \n"
            "Предварительные просмотры и подтверждения с проверками безопасности \n"
            "💳 Карта VoltVault \n"
            "Управление виртуальными и физическими дебетовыми картами VoltVault \n"
            "Установка лимитов на расходы, заморозка/разморозка или запрос новой карты \n"
            "Просмотр истории транзакций в фиатной валюте в традиционном банковском интерфейсе \n"
            "🪙 Криптокошельки \n"
            "Поддержка основных монет (BTC, ETH, USDT и др.) \n"
            "Получение через QR-код, внешние переводы в/из \n"
            "Предварительный просмотр транзакций и комиссий для каждой операции \n"
            "📊 Аналитика и история \n"
            "Визуальное представление активов (круговые, столбчатые диаграммы) \n"
            "Исторические данные о переводах и конвертациях \n"
            "Ежемесячные сводки активности с умными инсайтами \n"
            "🔐 Безопасность и конфиденциальность \n"
            "Биометрический вход (FaceID/отпечаток пальца) \n"
            "Двухфакторная аутентификация и аутентификация на основе устройства \n"
            "Подсказки для подтверждения транзакций \n"
            "🧠 Умные функции \n"
            "Сохранение операций моста в виде шаблонов \n"
            "Автоконвертация при достижении порога (например, автоматическая продажа BTC, если он достигнет \$60k) \n"
            "Vault Lock – криптосбережения на основе целей с таймером или условиями разблокировки \n"
            "🛟 Поддержка пользователей и ввод в эксплуатацию \n"
            "Бесшовный ввод в эксплуатацию с интеграцией KYC \n"
            "Чат поддержки в приложении, система тикетов и часто задаваемые вопросы \n"
            "Образовательные руководства для начинающих в криптовалюте \n"
      )
    };
  }

  @override
  void initializeAppScreens() {
    appScreens = {
      'vault_overview': (onNavigate, onPop) => VaultOverviewScreen(
          onNavigate: onNavigate,
          onPop: onPop,
          size: size
      ),
      'linkedAccounts': (onNavigate, onPop) => LinkedAccountsScreen(
        onNavigate: onNavigate,
        onPop: onPop,
        size: size,
      ),
    };
  }

  @override
  void setInitialScreenKey() {
    initialScreenKey = 'vault_overview';
  }
}

class VaultColors {
  static final black = Color(0xFF0C0E12);
  static final yellow = Color(0xFFFAD338);
  static final yellowShade = Color(0xFFF0B90B);
  static final white = Color(0xFFF5F5F5);
}
