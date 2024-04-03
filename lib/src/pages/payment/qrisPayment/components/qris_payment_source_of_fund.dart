import 'package:flutter/material.dart';

class QrisPaymentSourceOfFund extends StatefulWidget {
  const QrisPaymentSourceOfFund({super.key});

  @override
  State<QrisPaymentSourceOfFund> createState() => _SourceOfFundState();
}

class _SourceOfFundState extends State<QrisPaymentSourceOfFund> {
  String sourceOfFund = 'Item 1';
  String destinationAccount = 'Item 1';
  bool showBalance = false;

  void setSourceOfFund(newValue) {
    setState(() {
      sourceOfFund = newValue!;
    });
  }

  void setDestinationAccount(newValue) {
    setState(() {
      destinationAccount = newValue!;
    });
  }

  void setShowBalance() {
    setState(() {
      showBalance = !showBalance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Sumber Dana",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
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
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SourceOfFundDropdown(
                selectedItem: sourceOfFund,
                setSelectedItem: setSourceOfFund,
                text: 'Pilih Tipe Sumber Dana',
              ),
              const SizedBox(height: 15),
              _SourceOfFundDropdown(
                selectedItem: destinationAccount,
                setSelectedItem: setDestinationAccount,
                text: 'Rekening Debet',
              ),
              const SizedBox(height: 5),
              _SourceOfFundBalance(
                showBalance: showBalance,
                setShowBalance: setShowBalance,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _SourceOfFundBalance extends StatelessWidget {
  const _SourceOfFundBalance({
    required this.showBalance,
    required this.setShowBalance,
  });

  final bool showBalance;
  final Function() setShowBalance;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Saldo",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Row(
          children: [
            Text(showBalance ? "Rp 1.500.000.000" : "**********"),
            IconButton(
              onPressed: setShowBalance,
              icon: Icon(
                showBalance
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: Colors.blue,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _SourceOfFundDropdown extends StatelessWidget {
  const _SourceOfFundDropdown({
    required this.selectedItem,
    required this.setSelectedItem,
    required this.text,
  });

  final String text;
  final String selectedItem;
  final Function(String) setSelectedItem;

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
          "Pilih Tipe Sumber Dana",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DropdownButton<String>(
            isExpanded: true,
            iconEnabledColor: Colors.orange,
            value: selectedItem,
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
