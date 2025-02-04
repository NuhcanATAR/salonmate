import 'package:flutter/material.dart';
import 'package:salonmate/feature/account/account_viewmodel.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends AccountViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account View"),
      ),
    );
  }
}
