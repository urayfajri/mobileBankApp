import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/login.page.dart';

class HomeBtnLogout extends StatelessWidget {
  const HomeBtnLogout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.logout,
        color: Colors.orange,
        size: 35,
      ),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const LoginPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      },
    );
  }
}
