import 'package:flutter/material.dart';

class LinkedAccountsScreen extends StatelessWidget {
  final void Function(String screenKey) onNavigate;
  const LinkedAccountsScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Center(
        child: Text("Linked Accounts", style: TextStyle(color: Colors.white, fontSize: 22)),
      ),
    );
  }
}
