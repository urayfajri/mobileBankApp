import 'package:flutter/material.dart';

class BtnMenuQris extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const BtnMenuQris({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Mengisi lebar container sesuai parent
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color.fromARGB(255, 27, 193, 206),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 4),
            Icon(
              Icons.face_unlock_outlined,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
