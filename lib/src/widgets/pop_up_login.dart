import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/test_page.dart';
import 'package:mobile_bank_app/src/widgets/btn_login.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PopUpFormLogin extends StatefulWidget {
  const PopUpFormLogin({super.key});

  @override
  State<PopUpFormLogin> createState() => _PopUpFormLoginState();
}

class _PopUpFormLoginState extends State<PopUpFormLogin> {
  bool _isObscured = false;
// Changed to false

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Alert(
            style: AlertStyle(
              alertBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            context: context,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Selamat datang kembali,',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'User ID',
                  ),
                ),
                TextField(
                  obscureText: _isObscured,
                  decoration: InputDecoration(
                    labelText: 'MPIN',
                    suffixIcon: IconButton(
                      icon: Icon(_isObscured
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                          () {
                            _isObscured = !_isObscured;
                            print(_isObscured);
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lupa User ID?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 69, 88),
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromARGB(255, 0, 69, 88),
                      ),
                    ),
                    Text(
                      'Lupa MPIN?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 69, 88),
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromARGB(255, 0, 69, 88),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            buttons: [
              DialogButton(
                color: const Color.fromARGB(255, 27, 193, 206),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration:
                          const Duration(milliseconds: 800), // Durasi animasi
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin = const Offset(1.0, 0.0);
                        var end = Offset.zero;
                        var curve = Curves.ease;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const NewPage(),
                    ),
                  );
                },
                child: const Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ]).show();
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
      ),
      child: const BtnLogin(),
    );
  }
}
