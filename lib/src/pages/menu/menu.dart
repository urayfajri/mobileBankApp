import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/history/history.dart';
import 'package:mobile_bank_app/src/pages/home/home.dart';
import 'package:mobile_bank_app/src/pages/menu/components/menu_btn_chat_us.dart';
import 'package:mobile_bank_app/src/pages/menu/components/menu_bottom_bar.dart';
import 'package:mobile_bank_app/src/pages/menu/components/menu_btn_qris.dart';
import 'package:mobile_bank_app/src/pages/scan_qris.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {
  int selectedIndex = 0;

  final List<Widget> _pages = const [
    Home(),
    Pages(
      iconData: Icons.history,
      text: "History",
    ),
    Pages(
      iconData: Icons.qr_code,
      text: "QRIS",
    ),
    Pages(
      iconData: Icons.feed,
      text: "FEED",
    ),
    Pages(
      iconData: Icons.settings,
      text: "Settings",
    ),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ScanQris(),
        ),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HistoryPage(),
        ),
      );
    } else {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: BottomNavBar(
            onItemTapped: _onItemTapped,
            currentIndex: selectedIndex,
          ),
        ),
        body: _pages[selectedIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Stack(
          children: [
            const ChatUsFloatingButton(),
            Positioned(
              bottom: 25,
              right: MediaQuery.of(context).size.width / 2 - 40,
              left: MediaQuery.of(context).size.width / 2 - 40,
              child: QrisFloatingButton(onItemTapped: _onItemTapped),
            ),
          ],
        ),
      ),
    );
  }
}

class Pages extends StatelessWidget {
  const Pages({
    super.key,
    required this.iconData,
    required this.text,
  });

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 50,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
