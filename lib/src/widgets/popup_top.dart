import 'package:flutter/material.dart';

class PopUpTop extends StatelessWidget {
  final VoidCallback onCancel;

  const PopUpTop({super.key, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 69, 88),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.warning_amber,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Waspada',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      // Use Container to limit the width of the text
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width - 48),

                      child: const Text(
                        'Jangan berikan data pribadi seperti Kode OTP, PIN, dan Password kepada siapapun termasuk pihak BNI. Bila curiga akan terjadinya penipuan, segera hubungi BNI Call 1500046 untuk melaporkan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12), // Add space between text and icon
              GestureDetector(
                onTap: onCancel,
                child: const Icon(
                  Icons.cancel_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
