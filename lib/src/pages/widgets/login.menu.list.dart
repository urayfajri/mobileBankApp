import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/scan.page.dart';

class MenuIcons extends StatefulWidget {
  const MenuIcons({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MenuIconsState createState() => _MenuIconsState();
}

class _MenuIconsState extends State<MenuIcons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildMenuIcon(Icons.attach_money, 'e-money', Colors.orange),
          const SizedBox(width: 10),
          _buildMenuIcon(Icons.flash_on_outlined, 'Quick Pick', Colors.yellow),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 600),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      var begin = const Offset(0.0, 1.0);
                      var end = Offset.zero;
                      var curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const ScanPage(),
                  ));
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
            ),
            child: _buildMenuIcon(
                Icons.qr_code_2_outlined, 'QR Bayar', Colors.blueAccent),
          ),
          const SizedBox(width: 10),
          _buildMenuIcon(
              Icons.qr_code_scanner, 'QR Terima Transfer', Colors.blue),
          const SizedBox(width: 10),
          _buildMenuIcon(Icons.money_outlined, 'Setor Tarik', Colors.purple),
        ],
      ),
    );
  }

  Widget _buildMenuIcon(
      IconData iconData, String label, Color iconBackgroundColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: iconBackgroundColor,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(iconData, size: 30, color: Colors.white),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          constraints: const BoxConstraints(maxWidth: 60, minWidth: 60),
          height: 60,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
