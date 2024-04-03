import 'package:flutter/material.dart';

class HomeBtnMenuCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  const HomeBtnMenuCard({
    super.key,
    required this.text,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(25)),
          ),
          child: IconButton(
            onPressed: () {
              print("Button Pressed!");
            },
            icon: Icon(
              icon,
              size: 40,
              color: iconColor,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
