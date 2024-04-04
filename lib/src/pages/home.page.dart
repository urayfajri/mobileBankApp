import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/widgets/greeting.message.dart';
import 'package:mobile_bank_app/src/pages/widgets/horizontal.list.dart';
import 'package:mobile_bank_app/src/pages/widgets/menu.header.dart';
import 'package:mobile_bank_app/src/pages/widgets/other.dart';
import 'package:mobile_bank_app/src/pages/widgets/saving.deposite.dart';
import 'package:mobile_bank_app/src/pages/widgets/simple.banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String name = 'Jhon Doe Imanuel';
  late ScrollController _scrollController;
  bool _showScrollButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.maxScrollExtent ==
        _scrollController.position.pixels) {
      // If at the maximum scroll position
      setState(() {
        _showScrollButton = false;
      });
    } else {
      setState(() {
        _showScrollButton = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          height: 1200, // Adjust height as needed
          decoration: BoxDecoration(color: Colors.grey[100]),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              const HeaderImage(),
              GreetingMessage(name: name),
              const SimpleBanner(),
              const HorizontalList(),
              const SavingAndDeposite(),
              const Other()
            ],
          ),
        ),
      ),
      floatingActionButton: _showScrollButton
          ? Padding(
              padding: const EdgeInsets.only(bottom: 15), // Add bottom padding
              child: SizedBox(
                width: 200, // Set width according to your requirement
                height: 40, // Set height according to your requirement
                child: FloatingActionButton(
                  onPressed: () {
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  backgroundColor: Colors.white, // Set button color to white
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_downward, // Add arrow down icon
                        color: Colors.blue, // Set icon color
                      ),
                      SizedBox(width: 8), // Add spacing between icon and text
                      Text(
                        'Buka Produk Lainnya', // Add text
                        style: TextStyle(
                          color: Colors.blue, // Set text color
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
