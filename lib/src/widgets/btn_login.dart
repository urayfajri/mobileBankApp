import 'package:flutter/material.dart';

class BtnLogin extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const BtnLogin({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Mengisi lebar container sesuai parent
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color.fromARGB(255, 27, 193, 206),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4),
            Image.asset(
              'assets/images/face_id_icon.png',
              width: 22,
            ),
          ],
        ),
      ),
    );
  }
}
