import 'package:flutter/material.dart';
import 'package:mobile_bank_app/main.dart';
import 'package:mobile_bank_app/src/logic/secure.storage.service.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String _selectedLanguage = 'English';
  bool _showAdvancedSettings = false;
  final storage = SecureStorage();

  @override
  void initState() {
    super.initState();
    _checkLang();
  }

  Future<void> _checkLang() async {
    String? currentLang = await storage.readData('lang');
    setState(() {
      switch (currentLang) {
        case 'id':
          _selectedLanguage = 'Indonesia';
          break;
        case 'en':
          _selectedLanguage = 'English';
          break;
        case 'pt':
          _selectedLanguage = 'Brazil';
          break;
        case 'es':
          _selectedLanguage = 'Spanish';
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: (newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                  _changeLanguage(newValue);
                });
              },
              items: <String>['English', 'Spanish', 'Brazil', 'Indonesia']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Show Advanced Settings'),
            trailing: Switch(
              value: _showAdvancedSettings,
              onChanged: (bool value) {
                setState(() {
                  _showAdvancedSettings = value;
                });
              },
            ),
          ),
          if (_showAdvancedSettings) ...[
            ListTile(
              leading: const Icon(Icons.wifi),
              title: const Text('Wi-Fi'),
              trailing: Switch(
                value:
                    true, // You can set initial value based on user preference
                onChanged: (bool value) {
                  // Do something when the switch is toggled
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.bluetooth),
              title: const Text('Bluetooth'),
              trailing: Switch(
                value:
                    false, // You can set initial value based on user preference
                onChanged: (bool value) {
                  // Do something when the switch is toggled
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.lightbulb),
              title: const Text('Dark Mode'),
              trailing: Switch(
                value:
                    false, // You can set initial value based on user preference
                onChanged: (bool value) {
                  // Do something when the switch is toggled
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              trailing: Switch(
                value:
                    true, // You can set initial value based on user preference
                onChanged: (bool value) {
                  // Do something when the switch is toggled
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _changeLanguage(String lang) {
    switch (lang) {
      case 'Indonesia':
        MyApp.changeLocale(context, const Locale('id', 'ID'));
        storage.writeData('lang', 'id');
        break;
      case 'Brazil':
        MyApp.changeLocale(context, const Locale('pt', 'BR'));
        storage.writeData('lang', 'pt');
        break;
      case 'Spanish':
        MyApp.changeLocale(context, const Locale('es', 'ES'));
        storage.writeData('lang', 'es');
        break;
      case 'English':
        MyApp.changeLocale(context, const Locale('en', 'US'));
        storage.writeData('lang', 'en');
        break;
      default:
        break;
    }
  }
}
