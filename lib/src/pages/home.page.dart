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
  bool _showScrollButton = true;

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
              padding: const EdgeInsets.only(bottom: 15),
              child: SizedBox(
                width: 200,
                height: 40,
                child: FloatingActionButton(
                  onPressed: () {
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  backgroundColor: Colors.white,
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_downward,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Buka Produk Lainnya',
                        style: TextStyle(
                          color: Colors.blue,
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
