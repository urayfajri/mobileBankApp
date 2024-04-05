import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/history/components/input/history_period_date_picker.dart';

class HistoryPeriodRadio extends StatefulWidget {
  const HistoryPeriodRadio({super.key});

  @override
  HistoryPeriodRadioState createState() => HistoryPeriodRadioState();
}

class HistoryPeriodRadioState extends State<HistoryPeriodRadio> {
  String selectedValue = 'today';

  List<Map<String, String>> radioValues = [
    {
      "value": "today",
      "text": "Hari Ini",
    },
    {
      "value": "week",
      "text": "1 Minggu",
    },
    {
      "value": "month",
      "text": "1 Bulan",
    },
    {
      "value": "customDate",
      "text": "Pilih Tanggal",
    }
  ];

  void setSelectedValue(value) {
    setState(() {
      selectedValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        radioValues.length,
        (index) => _RadioOptionTile(
          selectedValue: selectedValue,
          setSelectedValue: setSelectedValue,
          value: radioValues[index]["value"]!,
          text: radioValues[index]["text"]!,
        ),
      ),
    );
  }
}

class _RadioOptionTile extends StatelessWidget {
  const _RadioOptionTile({
    required this.text,
    required this.value,
    required this.selectedValue,
    required this.setSelectedValue,
  });

  final String text;
  final String value;
  final String selectedValue;
  final Function(String) setSelectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 224, 224, 224),
            width: 1.0,
          ),
        ),
      ),
      child: Column(
        children: [
          RadioListTile<String>(
            title: Text(
              text,
              style: const TextStyle(fontSize: 15),
            ),
            contentPadding: const EdgeInsets.all(0),
            fillColor:
                MaterialStateColor.resolveWith((states) => Colors.orange),
            value: value,
            groupValue: selectedValue,
            onChanged: (String? value) {
              setSelectedValue(value!);
            },
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          if (selectedValue == "customDate" && value == "customDate")
            const HistoryDatePicker()
        ],
      ),
    );
  }
}
