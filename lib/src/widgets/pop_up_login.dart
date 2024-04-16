import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/menu/menu.dart';
// import 'package:mobile_bank_app/src/pages/test_page.dart';
import 'package:mobile_bank_app/src/widgets/btn_login.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PopUpFormLogin extends StatefulWidget {
  const PopUpFormLogin({super.key});

  @override
  State<PopUpFormLogin> createState() => _PopUpFormLoginState();
}

class _PopUpFormLoginState extends State<PopUpFormLogin> {
  bool _isObscured = false;
  bool isChecked = true;
// Changed to false

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Alert(
            style: AlertStyle(
              overlayColor: Colors.black45,
              animationType: AnimationType.grow,
              backgroundColor: Colors.white,
              alertBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            context: context,
            content: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: true, // atau false tergantung kebutuhan Anda
                        onChanged: (bool? value) {
                          // Logika ketika checkbox diubah
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              1), // Anda bisa menyesuaikan nilai ini
                        ),
                      ),
                      const Text(
                        'Simpan User ID',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
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
                          const Menu(),
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
        foregroundColor: Colors.white,
      ),
      child: const BtnLogin(),
    );
  }
}