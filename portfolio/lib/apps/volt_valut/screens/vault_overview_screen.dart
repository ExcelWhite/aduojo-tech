import 'package:flutter/material.dart';

class VaultOverviewScreen extends StatelessWidget {
  final void Function(String screenKey) onNavigate;

  const VaultOverviewScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Vault Overview"),
        ElevatedButton(
          onPressed: () => onNavigate('linkedAccounts'),
          child: Text("Go to Linked Accounts"),
        ),
        ElevatedButton(
          onPressed: () => onNavigate('analytics'),
          child: Text("Go to Analytics"),
        ),
      ],
    );
  }
}
