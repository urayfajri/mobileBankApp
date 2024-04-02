import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/widgets/input_password.dart';

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
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildMenuIcon(
                          Icons.attach_money, 'e-money', Colors.orange),
                      const SizedBox(width: 10),
                      _buildMenuIcon(
                          Icons.flash_on_outlined, 'Quick Pick', Colors.yellow),
                      const SizedBox(width: 10),
                      _buildMenuIcon(Icons.qr_code_2_outlined, 'QR Bayar',
                          Colors.blueAccent),
                      const SizedBox(width: 10),
                      _buildMenuIcon(Icons.qr_code_scanner,
                          'QR Terima Transfer', Colors.blue),
                      const SizedBox(width: 10),
                      _buildMenuIcon(
                          Icons.money_outlined, 'Setor Tarik', Colors.purple),
                    ],
                  ),
                ),
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
        return const BlurDialog();
      },
    );
  }
}

Widget _buildMenuIcon(
    IconData iconData, String label, Color iconBackgroundColor) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          color: iconBackgroundColor,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(iconData, size: 30, color: Colors.white),
        ),
      ),
      const SizedBox(height: 5),
      Container(
        constraints: const BoxConstraints(maxWidth: 60, minWidth: 60),
        height: 60,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
        ),
      ),
    ],
  );
}
