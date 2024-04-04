import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/widgets/greeting.message.dart';
import 'package:mobile_bank_app/src/pages/widgets/horizontal.list.dart';
import 'package:mobile_bank_app/src/pages/widgets/menu.header.dart';
import 'package:mobile_bank_app/src/pages/widgets/simple.banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String name = 'Jhon Doe Imanuel';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Container(
          height: 1000,
          decoration: BoxDecoration(color: Colors.grey[100]),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              const HeaderImage(),
              GreetingMessage(name: name),
              const SimpleBanner(),
              const HorizontalList(),
            ],
          ),
        ),
      ),
    );
  }
}
