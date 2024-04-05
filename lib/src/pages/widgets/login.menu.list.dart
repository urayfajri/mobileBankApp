import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/mutation.page.dart';
import 'package:mobile_bank_app/src/pages/scan.page.dart';
import 'package:mobile_bank_app/src/pages/widgets/menu.icon.dart';

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
          const CustomIconBox(
              iconData: Icons.attach_money,
              label: 'e-money',
              iconBackgroundColor: Colors.orange),
          const SizedBox(width: 10),
          const CustomIconBox(
              iconData: Icons.flash_off_outlined,
              label: 'Quick Pick',
              iconBackgroundColor: Colors.yellow),
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
            child: const CustomIconBox(
                iconData: Icons.qr_code_2_outlined,
                label: 'QR Bayarr',
                iconBackgroundColor: Colors.lightBlueAccent),
          ),
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
                        const MutationPage(),
                  ));
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
            ),
            child: const CustomIconBox(
                iconData: Icons.qr_code_scanner,
                label: 'QR Terima Transfer',
                iconBackgroundColor: Colors.blue),
          ),
          const SizedBox(width: 10),
          const CustomIconBox(
              iconData: Icons.money_outlined,
              label: 'Setor Tarik',
              iconBackgroundColor: Colors.purple),
        ],
      ),
    );
  }
}
