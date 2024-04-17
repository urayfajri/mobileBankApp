import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/home.page.dart';
import 'package:mobile_bank_app/src/pages/login.page.dart';
import 'package:mobile_bank_app/src/pages/chat.page.dart';
import 'package:mobile_bank_app/src/pages/setting.page.dart';
import 'package:mobile_bank_app/src/pages/widgets/test.dart';
import 'package:page_transition/page_transition.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentIndex = 0;

  Widget tabContentBuilder(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomePage();
      case 2:
        return const ChatPage();
      case 3:
        return const SettingPage();
      default:
        return const TestPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabContentBuilder(currentIndex),
      bottomNavigationBar: Container(
        height: 80,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          enableFeedback: false,
          onTap: (index) {
            if (index == 4) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Theme(
                    data: ThemeData(
                      primaryColor: Colors.blue,
                      hintColor: Colors.blueAccent,
                    ),
                    child: AlertDialog(
                      title: const Text('Logout',
                          style: TextStyle(color: Colors.black)),
                      content: const Text('Are you sure you want to logout?',
                          style: TextStyle(color: Colors.black)),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel',
                              style: TextStyle(color: Colors.red)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                type: PageTransitionType.bottomToTop,
                                duration: const Duration(milliseconds: 400),
                                child: const LoginPage(),
                                curve: Curves.easeInOut,
                              ),
                            );
                          },
                          child: const Text('Logout',
                              style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              setState(() {
                currentIndex = index;
              });
            }
          },
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.volume_down_outlined),
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
      ),
    );
  }
}
