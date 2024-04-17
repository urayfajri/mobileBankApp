import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class GreetingMessage extends StatefulWidget {
  const GreetingMessage({super.key, required this.name});

  final String name;

  @override
  // ignore: library_private_types_in_public_api
  _GreetingMessageState createState() => _GreetingMessageState();
}

class _GreetingMessageState extends State<GreetingMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'welcome-text'.i18n(),
            style: TextStyle(color: Colors.blue[900], fontSize: 16),
          ),
          Text(
            '${widget.name}...!',
            style: TextStyle(
              color: Colors.blue[900],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
