import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:mobile_bank_app/src/logic/localizaton.service.dart';
import 'package:mobile_bank_app/src/pages/login.page.dart';
import 'package:mobile_bank_app/src/logic/secure.storage.service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();

  static void changeLocale(BuildContext context, Locale newLocale) {
    final _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state._changeLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale _currentLocale = const Locale('id', 'ID');
  final localizationService = LocalizationService();
  final storage = SecureStorage();

  @override
  void initState() {
    super.initState();
    _checkLang();
  }

  Future<void> _checkLang() async {
    String? currentLang = await storage.readData('lang');
    setState(() {
      if (currentLang != null) {
        _currentLocale = localizationService.setLocale(currentLang);
      } else {
        storage.writeData('lang', 'id');
        _currentLocale = const Locale('id', 'ID');
      }
    });
  }

  // Function to change locale
  void _changeLocale(Locale newLocale) {
    setState(() {
      _currentLocale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];

    return MaterialApp(
      locale: _currentLocale,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocalJsonLocalization.delegate,
        MapLocalization.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
        Locale('pt', 'BR'),
        Locale('id', 'ID'),
      ],
      home: const LoginPage(),
    );
  }
}
