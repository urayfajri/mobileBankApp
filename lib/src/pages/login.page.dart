import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/widgets/input_password_dialog.dart';
import 'package:mobile_bank_app/src/pages/widgets/login_menu_list.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://ik.imagekit.io/fdu5ptj23co/Desain%20tanpa%20judul%20(2)%20(1)_XFkXrqPEd.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 550),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _showBlurDialog(context);
                    });
                  },
                  icon: const Icon(Icons.face),
                  label: const Text('Login'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
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
                ),
                const SizedBox(height: 30),
                const MenuIcons(),
              ],
            ),
          ),
        ),
      ),
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
}
