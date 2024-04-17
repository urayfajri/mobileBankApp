import 'package:flutter/material.dart';
import 'package:mobile_bank_app/main.dart';
import 'package:mobile_bank_app/src/logic/secure.storage.service.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<TestPage> {
  final storage = SecureStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                MyApp.changeLocale(context, const Locale('en', 'US'));
                storage.writeData('lang', 'en');
              },
              child: const Text('Switch to English'),
            ),
            ElevatedButton(
              onPressed: () {
                MyApp.changeLocale(context, const Locale('es', 'ES'));
                storage.writeData('lang', 'es');
              },
              child: const Text('Switch to Spanish'),
            ),
            ElevatedButton(
              onPressed: () {
                MyApp.changeLocale(context, const Locale('id', 'ID'));
                storage.writeData('lang', 'id');
              },
              child: const Text('Switch to Bahasa Indonesia'),
            ),
            ElevatedButton(
              onPressed: () {
                MyApp.changeLocale(context, const Locale('pt', 'BR'));
                storage.writeData('lang', 'pt');
              },
              child: const Text('Switch to Portuguese'),
            ),
          ],
        ),
      ),
    );
  }
}
