import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/payment/qrisPayment/components/qris_payment_app_bar.dart';
import 'package:mobile_bank_app/src/pages/payment/qrisPayment/components/qris_payment_bottom_app_bar.dart';
import 'package:mobile_bank_app/src/pages/payment/qrisPayment/components/qris_payment_input.dart';
import 'package:mobile_bank_app/src/pages/payment/qrisPayment/components/qris_payment_source_of_fund.dart';

class QrisPaymentPage extends StatelessWidget {
  const QrisPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: QrisPaymentAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          child: Column(
            children: [
              _MerchantInformation(),
              SizedBox(height: 30),
              QrisPaymentSourceOfFund(),
              SizedBox(height: 10),
              QrisPaymentInput()
            ],
          ),
        ),
      ),
      bottomNavigationBar: QrisPaymentBottomAppBar(),
    );
  }
}

class _MerchantInformation extends StatelessWidget {
  const _MerchantInformation();

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontSize: 18,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Informasi Merchant"),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(20),
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
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nama Merchant"),
                    Text("Kantin Ibu Lilik"),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Lokasi Merchant"),
                    Text("Jakarta Pusat"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
