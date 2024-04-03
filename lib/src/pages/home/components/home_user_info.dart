import 'package:flutter/material.dart';

class UserAccountInfo extends StatelessWidget {
  const UserAccountInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DefaultTextStyle(
      style: TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      child: Row(
        children: [
          Icon(
            Icons.account_circle,
            size: 70,
            color: Colors.grey,
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Selamat Datang,"),
              Text("User"),
            ],
          )
        ],
      ),
    );
  }
}
