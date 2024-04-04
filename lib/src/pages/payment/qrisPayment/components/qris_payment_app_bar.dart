import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/menu/menu.dart';

class QrisPaymentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const QrisPaymentAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'Pembayaran QRIS',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.grey,
        ),
        onPressed: () {
          print("item Pressed");
          Navigator.of(context).pop();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.house,
            color: Colors.orange,
            size: 35,
          ),
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
                    const Menu(),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
