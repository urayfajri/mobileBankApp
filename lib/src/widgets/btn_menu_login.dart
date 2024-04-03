import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/scan_qris.dart';

class BtnMenuLogin extends StatelessWidget {
  const BtnMenuLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton(
          context,
          Icons.account_balance_wallet,
          'E-Wallet',
          const Color.fromARGB(255, 34, 139, 249),
          () {},
        ),
        _buildButton(
          context,
          Icons.qr_code_outlined,
          'QRIS',
          const Color.fromARGB(255, 249, 118, 6),
          () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 800),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  var begin = const Offset(1.0, 0.0);
                  var end = Offset.zero;
                  var curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
                pageBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                ) =>
                    const ScanQris(),
              ),
            );
          },
        ),
        _buildButton(
          context,
          Icons.menu,
          'Menu Lain',
          const Color.fromARGB(255, 27, 193, 206),
          () {},
        ),
      ],
    );
  }

  Widget _buildButton(
    BuildContext context,
    IconData icon,
    String label,
    Color color,
    VoidCallback onPressed,
  ) {
    return InkWell(
      onTap: onPressed, // Fungsi yang akan dijalankan saat tombol ditekan
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: color,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 32.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
