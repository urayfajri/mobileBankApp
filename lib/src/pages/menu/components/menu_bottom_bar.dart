import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.onItemTapped,
    required this.currentIndex,
  });

  final Function(int) onItemTapped;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(
            width: 2,
            color: Color.fromARGB(255, 226, 226, 226),
          ),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontSize: 16),
        unselectedLabelStyle: const TextStyle(fontSize: 16),
        iconSize: 35,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: "QRIS",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_outline),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }
}
