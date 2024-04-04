import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mobile_bank_app/src/models/result_scan.model.dart';

class TransactionPage extends StatefulWidget {
  final ResultScan resultScan;

  const TransactionPage({super.key, required this.resultScan});

  @override
  // ignore: no_logic_in_create_state
  State<TransactionPage> createState() =>
      // ignore: no_logic_in_create_state
      _TransactionPageState(resultScan: resultScan);
}

class _TransactionPageState extends State<TransactionPage> {
  final ResultScan resultScan;

  _TransactionPageState({required this.resultScan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // Set background color to white
            ),
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 202, 200, 200),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        getInitialWord(resultScan.name),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 122, 121, 121)),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    color: Colors.white,
                    child: Text(
                      resultScan.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      resultScan.city,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    child: Text(
                      'Merchant PAN ${resultScan.kodepan}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CurrencyInputFormatter(),
                        ],
                        onChanged: (value) {},
                        //editing controller of this TextField
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                        decoration: const InputDecoration(
                          labelText: "Nominal Transaksi", //label text of field
                          labelStyle: TextStyle(
                              color: Colors.blue,
                              fontSize: 16), // Change label text color
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue), // Change underline color
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .blue), // Change underline color when focused
                          ),
                        )),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

String getInitialWord(String input) {
  // Pisahkan kata-kata dalam string menjadi list
  List<String> word = input.split(' ');

  String result = '';

  for (int i = 0; i < word.length; i++) {
    // Ambil karakter pertama dari kata
    if (i == 0 || i == word.length - 1) {
      if (word[i].isNotEmpty) {
        result += word[i][0];
      }
    }
  }

  return result;
}

class CurrencyInputFormatter extends TextInputFormatter {
  final int decimalDigits;

  CurrencyInputFormatter({this.decimalDigits = 0});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      decimalDigits: decimalDigits,
      symbol: 'Rp',
    );
    String newText = formatter.format(value);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
