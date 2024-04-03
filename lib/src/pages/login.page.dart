import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/widgets/btn_chat_us.dart';
import 'package:mobile_bank_app/src/widgets/btn_menu_login.dart';
import 'package:mobile_bank_app/src/widgets/pop_up_login.dart';
// import 'package:mobile_bank_app/src/widgets/pop_up_login.dart';
// import 'package:mobile_bank_app/src/widgets/popup_login.dart';
import 'package:mobile_bank_app/src/widgets/popup_top.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool isAlertTop;
  @override
  void initState() {
    super.initState();
    isAlertTop = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedOpacity(
              duration: const Duration(
                  milliseconds: 500), // Durasi animasi (misalnya 500 milidetik)
              opacity: isAlertTop
                  ? 1.0
                  : 0.0, // Atur opacity berdasarkan nilai isAlertTop
              child: PopUpTop(
                onCancel: () {
                  setState(() {
                    isAlertTop = false;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 80),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/logo_bni.png',
                          width: 200,
                        ),
                        const SizedBox(height: 30),
                        const PopUpFormLogin(),
                        const SizedBox(
                          height: 14,
                        ),
                        const BtnMenuLogin()
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        elevation: 0, // Removes the shadow
        color: Colors.transparent,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [BtnChatUs()],
        ),
      ),
    );
  }
}
