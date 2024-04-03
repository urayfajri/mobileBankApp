import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/widgets/input.password.dialog.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: Column(),
    );
  }

  void _showBlurDialog(BuildContext context) {
    showDialog(
      barrierColor: Colors.white.withOpacity(0.4),
      context: context,
      builder: (BuildContext context) {
        return const InputPasswordDialog();
      },
    );
  }

  void _showBottomModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) => _bottomModal(context),
    );
  }

  Widget _bottomModal(BuildContext context) {
    return Container(
      width: 350,
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => {
          setState(() {
            print('tap');
          })
        },
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              width: 50,
              height: 5,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 20),
            const Text(
              'Spesial untuk Anda yang spesial!',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Langsung swipe up, jangan sampai terlewat!',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
