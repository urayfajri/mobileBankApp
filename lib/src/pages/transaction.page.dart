import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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
                                _showBlurDialog(context, value);
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

  void _showBlurDialog(BuildContext context, String inputPrice) {
    showDialog(
      barrierColor: Colors.black.withOpacity(0.7),
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 16, left: 16, top: 32, bottom: 24),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Konfirmasi Transaksi',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Times New Roman',
                              color: Colors.black),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.close,
                              color: Colors.grey,
                              size: 24,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 202, 200, 200),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14),
                                child: Text(
                                  getInitialWord(resultScan.name),
                                  style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: 'Noto Sans',
                                      color:
                                          Color.fromARGB(255, 122, 121, 121)),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  color: Colors.white,
                                  child: Text(
                                    resultScan.name,
                                    style: const TextStyle(
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        fontFamily: 'Times New Roman',
                                        color: Colors.black),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    resultScan.city,
                                    style: const TextStyle(
                                        decoration: TextDecoration.none,
                                        fontFamily: 'Times New Roman',
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromARGB(255, 112, 109, 109),
                                        fontSize: 14),
                                  ),
                                ),
                                Text(
                                  'Merchant PAN • ${resultScan.kodepan}',
                                  style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      fontFamily: 'Times New Roman',
                                      fontWeight: FontWeight.w100,
                                      color: Colors.grey,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Nominal',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 16,
                              fontWeight: FontWeight.w100,
                              fontFamily: 'Times New Roman',
                              color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            inputPrice,
                            style: const TextStyle(
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: 'Times New Roman',
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 8,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 243, 243, 243),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 16, left: 16, top: 16, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Sumber Dana',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w100,
                          fontSize: 16,
                          fontFamily: 'Times New Roman',
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 196, 196, 196)
                                  .withOpacity(0.3), // Shadow color
                              spreadRadius: 3, // Spread radius
                              blurRadius: 3, // Blur radius
                              offset: const Offset(
                                  -3, 3), // Offset in x and y direction
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${_isSavingClicked ? 'Tabungan' : 'Kredit'} Mandiri  071237463527',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                        fontSize: 14,
                                        fontFamily: 'Times New Roman',
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'RP 271.000.000',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w100,
                                    fontSize: 16,
                                    fontFamily: 'Times New Roman',
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextButton(
                        onPressed: () {
                          // Button action
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Lanjut Bayar',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Row(
                                children: [
                                  Text(
                                    inputPrice,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
