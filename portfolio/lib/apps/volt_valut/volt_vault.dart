import 'package:flutter/material.dart';
import 'package:portfolio/apps/volt_valut/screens/linked_accounts_screen.dart';
import 'package:portfolio/apps/volt_valut/screens/vault_overview_screen.dart';

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
      'title': 'VoltVault',

      'description': "VoltVault is a next-generation mobile application designed"
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

      'features': "🌟 Core Features\n"
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
