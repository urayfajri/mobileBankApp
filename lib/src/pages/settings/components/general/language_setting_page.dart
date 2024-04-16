import 'package:flutter/material.dart';
import 'package:mobile_bank_app/config/language.dart';
import 'package:mobile_bank_app/config/language_constant.dart';
import 'package:mobile_bank_app/main.dart';
import 'package:mobile_bank_app/src/pages/settings/components/general/general_app_bar.dart';

class LanguageSettingPage extends StatelessWidget {
  const LanguageSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GeneralAppBar(title: "Bahasa"),
      body: _LanguageSettingBody(),
    );
  }
}

class _LanguageSettingBody extends StatelessWidget {
  const _LanguageSettingBody();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          _LanguageSelectDropdown(),
        ],
      ),
    );
  }
}

class _LanguageSelectDropdown extends StatefulWidget {
  const _LanguageSelectDropdown();

  @override
  _LanguageSelectDropdownState createState() => _LanguageSelectDropdownState();
}

class _LanguageSelectDropdownState extends State<_LanguageSelectDropdown> {
  Language? selectedItem;
  String? select;

  @override
  void initState() {
    super.initState();
    selectedItem =
        Language.languageList().firstWhere((lang) => lang.languageCode == 'id');
  }

  void setSelectedItem(Language? newValue) {
    setState(() {
      select = newValue!.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Pilih Bahasa",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DropdownButton<Language>(
            onChanged: (Language? language) async {
              if (language != null) {
                Locale locale = await setLocale(language.languageCode);
                MyApp.setLocale(context, locale);
                setSelectedItem(language);
              }
            },
            isExpanded: true,
            iconEnabledColor: Colors.grey,
            icon: const Icon(Icons.expand_more),
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
        )
      ],
    );
  }
}
