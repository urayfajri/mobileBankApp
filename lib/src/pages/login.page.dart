import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_bank_app/config/language.dart';
import 'package:mobile_bank_app/config/language_constant.dart';
import 'package:mobile_bank_app/main.dart';
import 'package:mobile_bank_app/src/widgets/btn_chat_us.dart';
import 'package:mobile_bank_app/src/widgets/btn_menu_login.dart';
import 'package:mobile_bank_app/src/widgets/pop_up_login.dart';
import 'package:mobile_bank_app/src/widgets/popup_top.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool isAlertTop;
  // Default language is English
  @override
  void initState() {
    super.initState();
    isAlertTop = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0.21, 0.53],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0x7FFFFFFF), Color(0xFFE5F6F7)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedOpacity(
                duration: const Duration(
                    milliseconds:
                        500), // Durasi animasi (misalnya 500 milidetik)
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
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0, // Removes the shadow
        color: Colors.transparent,
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BtnChatUs(),
            DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: Colors.black,
              ),
              onChanged: (Language? language) async {
                if (language != null) {
                  Locale locale = await setLocale(language.languageCode);
                  // ignore: use_build_context_synchronously
                  MyApp.setLocale(context, locale);
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
