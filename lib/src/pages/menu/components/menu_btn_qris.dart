import 'package:flutter/material.dart';

class QrisFloatingButton extends StatelessWidget {
  const QrisFloatingButton({super.key, required this.onItemTapped});

  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: 75,
      height: 75,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: FloatingActionButton(
        elevation: 0,
        onPressed: () => {
          onItemTapped(2),
        },
        materialTapTargetSize: MaterialTapTargetSize.padded,
        backgroundColor: Colors.orange,
        shape: const CircleBorder(
          side: BorderSide(color: Color.fromARGB(255, 255, 225, 187), width: 5),
        ),
        child: const Icon(
          Icons.qr_code,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
