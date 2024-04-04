import 'package:flutter/material.dart';

class Other extends StatefulWidget {
  const Other({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OtherState createState() => _OtherState();
}

class _OtherState extends State<Other> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              Text(
                "Other",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.blue[900]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
