import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/apps/volt_valut/volt_vault.dart';

class VaultOverviewScreen extends StatelessWidget {
  final void Function(String screenKey) onNavigate;
  final VoidCallback onPop;
  final Size size;

  const VaultOverviewScreen({super.key, required this.onNavigate, required this.size, required this.onPop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VaultColors.black,
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height*0.02),

              Row(
                children: [
                  Image.asset('assets/images/voltvault/vv_logo.png', width: size.width*0.15,),
                  const Spacer(),
                  CircleAvatar(
                    radius: size.width*0.075,
                    backgroundColor: VaultColors.yellowShade,
                    child: Icon(Icons.person, size: size.width*0.1, color: VaultColors.black),
                  )
                ],
              ),

              SizedBox(height: size.height*0.05),

              Container(
                width: size.width-16,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: VaultColors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Total Balance", style: GoogleFonts.montserrat(color: VaultColors.white, fontSize: 14)),
                    SizedBox(height: 8),
                    Text("\$ 23,450.75", style: GoogleFonts.montserrat(color: VaultColors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),

              SizedBox(height: size.height*0.05),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _balanceCard("Crypto Balance", "₿1.2 BTC", Icons.currency_bitcoin),
                  SizedBox(width: size.width*0.1,),
                  _balanceCard("Fiat Balance", "\$6,450.75", Icons.credit_card),
                ],
              ),

              SizedBox(height: size.height*0.05),

              GestureDetector(
                onTap: () => onNavigate("linkedAccounts"),
                child: Container(
                  width: size.width-16,
                  height: 44,
                  decoration: BoxDecoration(
                    color: VaultColors.yellow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Go to Linked Accounts',
                      style: GoogleFonts.montserrat(
                          color: VaultColors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                ),
              ),

              SizedBox(height: size.height*0.05),

              Text(
                "Quick Actions",
                style: GoogleFonts.montserrat(
                  color: VaultColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                )
              ),

              SizedBox(height: size.height*0.02),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _actionButton(context, "Send", Icons.send),
                  _actionButton(context, "Receive", Icons.call_received),
                  _actionButton(context, "Convert", Icons.swap_horiz),
                  _actionButton(context, "Top Up", Icons.add_circle_outline),
                  _actionButton(context, "Withdraw", Icons.arrow_downward),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _balanceCard(String label, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: VaultColors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.amberAccent, size: 30),
            const SizedBox(height: 8),
            Text(label, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 4),
            Text(value, textAlign: TextAlign.center, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 16)),
          ],
        ),
      ),
    );
  }

  static Widget _actionButton(BuildContext context, String label, IconData icon) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: VaultColors.white.withOpacity(0.2),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      icon: Icon(icon, size: 18),
      label: Text(label),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Updates will be made later.'),
            duration: Duration(seconds: 2),
          ),
        );
      },
    );
  }
}
