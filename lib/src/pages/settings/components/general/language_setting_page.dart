import 'package:flutter/material.dart';
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
          _HistoryAccountSelectDropdown(),
        ],
      ),
    );
  }
}

class _HistoryAccountSelectDropdown extends StatefulWidget {
  const _HistoryAccountSelectDropdown();

  @override
  _HistoryAccountSelectDropdownState createState() =>
      _HistoryAccountSelectDropdownState();
}

class _HistoryAccountSelectDropdownState
    extends State<_HistoryAccountSelectDropdown> {
  String selectedItem = "Indonesia";

  void setSelectedItem(newValue) {
    setState(() {
      selectedItem = newValue!;
    });
  }

  static const items = [
    'Indonesia',
    'English',
  ];

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
          child: DropdownButton<String>(
            isExpanded: true,
            iconEnabledColor: Colors.grey,
            value: selectedItem,
            icon: const Icon(Icons.expand_more),
            onChanged: (String? newValue) {
              setSelectedItem(newValue!);
            },
            items: items.map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                );
              },
            ).toList(),
          ),
        )
      ],
    );
  }
}
