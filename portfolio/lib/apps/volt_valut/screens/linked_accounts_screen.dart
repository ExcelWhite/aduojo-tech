import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../volt_vault.dart';

class LinkedAccountsScreen extends StatelessWidget {
  final void Function(String screenKey) onNavigate;
  final VoidCallback onPop;
  final Size size;

  const LinkedAccountsScreen({super.key, required this.onNavigate, required this.size, required this.onPop});

  @override
  Widget build(BuildContext context) {
    final wallets = [
      {"name": "BTC Wallet", "balance": "₿0.75", "address": "bc1qxyz..."},
      {"name": "ETH Wallet", "balance": "Ξ12.3", "address": "0xAbc123..."},
    ];

    final cards = [
      {"name": "VoltVault Visa", "last4": "1234", "balance": "\$4,500"},
      {"name": "VoltVault MC", "last4": "5678", "balance": "\$1,950"},
    ];

    return Scaffold(
      backgroundColor: VaultColors.black,
      appBar: AppBar(
        backgroundColor: VaultColors.black,
        leading: IconButton(
            onPressed: onPop,
            icon: Icon(Icons.arrow_back_ios, color: VaultColors.white,)
        ),
        title: Text(
          "Linked Accounts",
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold
          )
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text("🔗 Linked Wallets", style: GoogleFonts.montserrat(color: VaultColors.white, fontSize: 18)),
            const SizedBox(height: 8),
            ...wallets.map((wallet) => _walletCard(wallet)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Updates will be made later.'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Container(
                width: size.width - 32,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: VaultColors.yellowShade
                ),
                child: Center(
                  child: Text(
                    'Add Wallet',
                    style: GoogleFonts.montserrat(
                      color: VaultColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text("💳 Linked Cards", style: GoogleFonts.montserrat(color: VaultColors.white, fontSize: 18)),
            const SizedBox(height: 8),
            ...cards.map((card) => _cardCard(card)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Updates will be made later.'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Container(
                width: size.width - 32,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: VaultColors.yellowShade
                ),
                child: Center(
                  child: Text(
                    'Add Bank Card',
                    style: GoogleFonts.montserrat(
                      color: VaultColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _walletCard(Map wallet) {
    return Card(
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.account_balance_wallet, color: Colors.amber),
        title: Text(wallet['name'], style: GoogleFonts.montserrat(color: Colors.white)),
        subtitle: Text(wallet['address'], style: GoogleFonts.montserrat(color: Colors.grey)),
        trailing: Text(wallet['balance'], style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _cardCard(Map card) {
    return Card(
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.credit_card, color: Colors.lightBlueAccent),
        title: Text(card['name'], style: GoogleFonts.montserrat(color: Colors.white)),
        subtitle: Text("**** **** **** ${card['last4']}", style: GoogleFonts.montserrat(color: Colors.grey)),
        trailing: Text(card['balance'], style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
