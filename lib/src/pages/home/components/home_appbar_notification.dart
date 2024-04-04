import 'package:flutter/material.dart';

class AppBarNotificationIcon extends StatelessWidget {
  const AppBarNotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(
            Icons.notifications_none,
            color: Colors.orange,
            size: 35,
          ),
          onPressed: () {
            print("item Pressed");
          },
        ),
        Positioned(
          right: 8,
          top: 10,
          child: Container(
            height: 15,
            width: 15,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
