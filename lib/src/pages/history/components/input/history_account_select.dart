import 'package:flutter/material.dart';

class HistoryAccountSelect extends StatelessWidget {
  const HistoryAccountSelect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 218, 218, 218),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: const _HistoryAccountSelectDropdown(),
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
  String selectedItem = "Item 1";

  void setSelectedItem(newValue) {
    setState(() {
      selectedItem = newValue!;
    });
  }

  static const items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Pilih Rekening",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
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
