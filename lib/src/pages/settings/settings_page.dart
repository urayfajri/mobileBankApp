import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/settings/components/general_settings_section.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengaturan"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: const Column(
          children: [
            GeneralSettingsSection(),
          ],
        ),
      ),
    );
  }
}
