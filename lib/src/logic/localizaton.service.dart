import 'package:flutter/material.dart';

class LocalizationService {
  Locale setLocale(String languageCode) {
    switch (languageCode) {
      case 'en':
        return const Locale('en', 'US');
      case 'es':
        return const Locale('es', 'ES');
      case 'pt':
        return const Locale('pt', 'BR');
      default:
        return const Locale('id', 'ID');
    }
  }
}
