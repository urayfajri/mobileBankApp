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
              backgroundColor: Colors.white,
              elevation: 0,
              foregroundColor: Colors.white,
              // This sets the background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0), // Rounded corners
                side: const BorderSide(
                  color: Color.fromARGB(255, 225, 225, 225), // Border color
                  width: 1, // Border width
                ),
              ),
            ),
            child: const Center(
              child: Row(
                mainAxisSize: MainAxisSize
                    .min, // Set to min to make the button width fit its content
                children: [
                  Icon(
                    Icons.headphones,
                    color: Colors.blue,
                    size: 14,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Chat Us',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Version 5.12.0',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black45),
        ),
      ],
    );
  }
}
