import 'package:flutter/material.dart';

class BtnChatUs extends StatelessWidget {
  const BtnChatUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // This sets the background color
            ),
            child: const Center(
              child: Row(
                mainAxisSize: MainAxisSize
                    .min, // Set to min to make the button width fit its content
                children: [
                  Text(
                    'Chat Us',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.headphones,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Version 5.12.0',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ],
    );
  }
}
