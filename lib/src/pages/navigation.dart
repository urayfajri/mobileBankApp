import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/home.page.dart';
import 'package:mobile_bank_app/src/pages/widgets/test.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPage();
}

class _NavigationPage extends State<NavigationPage> {
  int currentIndex = 0;

  Widget tabContentBuilder(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomePage();
      default:
        return const TestPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabContentBuilder(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.markunread_outlined),
            label: 'Promo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.markunread_outlined),
            label: 'Pesan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Pengaturan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Log Out',
          ),
        ],
      ),
    );
  }
}
