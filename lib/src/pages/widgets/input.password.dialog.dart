import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/logic/secure.storage.service.dart';
import 'package:mobile_bank_app/src/pages/navigation.dart';
import 'package:page_transition/page_transition.dart';

class InputPasswordDialog extends StatefulWidget {
  const InputPasswordDialog({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InputPasswordDialogState createState() => _InputPasswordDialogState();
}

class _InputPasswordDialogState extends State<InputPasswordDialog> {
  bool _isPasswordVisible = false;
  late TextEditingController _controllerPassword;
  final storage = SecureStorage();

  @override
  void initState() {
    super.initState();
    _controllerPassword = TextEditingController();
    _loadPasswordFromStorage();
  }

  Future<void> _loadPasswordFromStorage() async {
    String? storageValue = await storage.readData('password');
    setState(() {
      if (storageValue != null) {
        _controllerPassword.text = storageValue;
      } else {
        storage.writeData('password', '');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ListView(
        children: [
          const SizedBox(height: 30),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              color: Colors.transparent,
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Image.network(
                    'https://ik.imagekit.io/fdu5ptj23co/sdas_YLDWAyExuA.png',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(height: 60),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      border: Border.all(color: Colors.blue),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _controllerPassword,
                      onChanged: (value) {
                        storage.updateData('password', value);
                      },
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off_rounded,
                              size: 30,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.leftToRight,
                          duration: const Duration(milliseconds: 400),
                          child: const NavigationPage(),
                          curve: Curves.easeInOut,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 10,
                      shadowColor: const Color.fromARGB(255, 243, 244, 245)
                          .withOpacity(0.1),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Lupa Password?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
