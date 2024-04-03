import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/home/home.dart';
import 'package:mobile_bank_app/src/pages/menu/components/menu_btn_chat_us.dart';
import 'package:mobile_bank_app/src/pages/menu/components/menu_bottom_bar.dart';
import 'package:mobile_bank_app/src/pages/menu/components/menu_btn_qris.dart';

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
      iconData: Icons.article,
      text: "Transaction",
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
      iconData: Icons.feed,
      text: "FEED",
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('BNI'),
          centerTitle: false,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              print("item Pressed");
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.orange,
                size: 35,
              ),
              onPressed: () {
                print("item Pressed");
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.orange,
                size: 35,
              ),
              onPressed: () {
                print("item Pressed");
              },
            ),
          ],
        ),
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
              bottom: 30.0,
              right: MediaQuery.of(context).size.width / 2 - 37,
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

// class SettingPage extends StatelessWidget {
//   const SettingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => {
//             Navigator.push(
//               context,
//               PageRouteBuilder(
//                 pageBuilder: (context, animation, secondaryAnimation) =>
//                     const LoginPage(),
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) {
//                   return FadeTransition(
//                     opacity: animation,
//                     child: child,
//                   );
//                 },
//               ),
//             ),
//           },
//           child: const Text("Logout"),
//         ),
//       ),
//     );
//   }
// }


