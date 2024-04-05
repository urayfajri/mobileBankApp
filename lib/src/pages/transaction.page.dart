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
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ResultScan resultScan;

  final FocusNode _focusNode = FocusNode();

  String _inputNominalTransaction = '';
  bool _isCreditCardBalanceClicked = false;
  bool _isSavingClicked = true;

  _TransactionPageState({required this.resultScan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: const Color.fromARGB(255, 243, 243, 243),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 196, 196, 196)
                            .withOpacity(0.3), // Shadow color
                        spreadRadius: 3, // Spread radius
                        blurRadius: 3, // Blur radius
                        offset:
                            const Offset(0, 3), // Offset in x and y direction
                      ),
                    ],
                  ),
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
                          'Merchant PAN • ${resultScan.kodepan}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 24, left: 24, bottom: 32),
                        child: TextField(
                            focusNode: _focusNode,
                            autofocus: true, // Set autofocus
                            controller: _controller,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CurrencyInputFormatter(),
                            ],
                            onSubmitted: (value) {
                              // Handle the submitted value here
                              setState(() {
                                _inputNominalTransaction = value;
                              });

                              if (value.length > 4) {
                                _showBlurDialog(context);
                              }
                            },
                            //editing controller of this TextField
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              labelText:
                                  "Nominal Transaksi", //label text of field
                              labelStyle: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16), // Change label text color
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Colors.blue), // Change underline color
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors
                                        .blue), // Change underline color when focused
                              ),
                              suffixIcon: _inputNominalTransaction.isNotEmpty
                                  ? IconButton(
                                      icon: const Icon(Icons
                                          .clear_rounded), // Icon for clearing input
                                      onPressed: () {
                                        // Function to clear input
                                        _controller.clear();
                                        _inputNominalTransaction = '';
                                      },
                                    )
                                  : null,
                            )),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Sumber Dana',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isSavingClicked = false;
                              _isCreditCardBalanceClicked = true;
                              _scrollController.animateTo(
                                0.0, // Scroll position to animate to, in this case, the top (0.0)
                                duration: const Duration(
                                    milliseconds:
                                        500), // Duration of the animation
                                curve: Curves.easeInOut, // Animation curve
                              );
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: _isCreditCardBalanceClicked
                                  ? const Color.fromARGB(255, 198, 248, 246)
                                  : Colors.white,
                              border: Border.all(
                                color: _isCreditCardBalanceClicked
                                    ? Colors.blue
                                    : Colors.grey, // Border color
                                width: _isCreditCardBalanceClicked ? 1.0 : 0.7,
                                // Border width
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 6),
                              child: Text(
                                'Kartu Kredit',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: _isCreditCardBalanceClicked
                                        ? Colors.blue
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isSavingClicked = true;
                              _isCreditCardBalanceClicked = false;
                              _scrollController.animateTo(
                                0.0, // Scroll position to animate to, in this case, the top (0.0)
                                duration: const Duration(
                                    milliseconds:
                                        500), // Duration of the animation
                                curve: Curves.easeInOut, // Animation curve
                              );
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: _isSavingClicked
                                  ? const Color.fromARGB(255, 198, 248, 246)
                                  : Colors.white,
                              border: Border.all(
                                color: _isSavingClicked
                                    ? Colors.blue
                                    : Colors.grey, // Border color
                                width: _isSavingClicked ? 1.0 : 0.7,
                                // Border width
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 6),
                              child: Text(
                                'Tabungan',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: _isSavingClicked
                                        ? Colors.blue
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    _isSavingClicked
                        ? SizedBox(
                            height: 120,
                            child: ListView(
                              controller: _scrollController,
                              // This next line does the trick.
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                _cardBalanceInformation(
                                    'Tabungan', 'Rp 271.000.000'),
                                const SizedBox(
                                  width: 16,
                                ),
                                _cardBalanceInformation(
                                    'Tabungan', 'Rp 271.000'),
                                const SizedBox(
                                  width: 16,
                                ),
                                _cardBalanceInformation('Tabungan', 'Rp 2.710'),
                                const SizedBox(
                                  width: 16,
                                ),
                                _cardBalanceInformation(
                                    'Tabungan', 'Rp 27.100'),
                              ],
                            ),
                          )
                        : SizedBox(
                            height: 120,
                            child: ListView(
                              // This next line does the trick.
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                _cardBalanceInformation(
                                    'Kredit', 'Rp 100.000.000'),
                                const SizedBox(
                                  width: 16,
                                ),
                                _cardBalanceInformation(
                                    'Kredit', 'Rp 100.000.000'),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void _showBlurDialog(BuildContext context) {
    showDialog(
      barrierColor: Colors.black.withOpacity(0.7),
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            child: const Text('test'),
          ),
        );
      },
    );
  }

  Widget _cardBalanceInformation(
    String title,
    String price,
  ) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 45,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: Container(
              height: 120,
              width: 90,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://ik.imagekit.io/fdu5ptj23co/000071-05_jenis-jenis-kartu-atm-mandiri_gold-gpn_800x450_ccpdm-min%20(2)_A-b415Vdu.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 120,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '$title Mandiri',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(
                            20), // Adjust the radius as needed
                      ),
                      child: const Padding(
                          padding: EdgeInsets.all(2),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 20,
                          )),
                    )
                  ],
                ),
                const Text(
                  '071237463527',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                Text(
                  price,
                  style: const TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
      symbol: 'Rp ',
    );
    String newText = formatter.format(value);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
