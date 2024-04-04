import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/models/result_scan_model.dart';
import 'package:mobile_bank_app/src/pages/payment/qrisPayment/components/qris_payment_app_bar.dart';
import 'package:mobile_bank_app/src/pages/payment/qrisPayment/components/qris_payment_bottom_app_bar.dart';
import 'package:mobile_bank_app/src/pages/payment/qrisPayment/components/qris_payment_input.dart';
import 'package:mobile_bank_app/src/pages/payment/qrisPayment/components/qris_payment_source_of_fund.dart';

class QrisPaymentPage extends StatelessWidget {
  final ResultScanModel resulScanQris;
  const QrisPaymentPage({super.key, required this.resulScanQris});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const QrisPaymentAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          child: Column(
            children: [
              _MerchantInformation(resulScanQris: resulScanQris),
              const SizedBox(height: 30),
              const QrisPaymentSourceOfFund(),
              const SizedBox(height: 10),
              const QrisPaymentInput()
            ],
          ),
        ),
      ),
      bottomNavigationBar: const QrisPaymentBottomAppBar(),
    );
  }
}

class _MerchantInformation extends StatelessWidget {
  final ResultScanModel resulScanQris;
  const _MerchantInformation({required this.resulScanQris});

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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Nama Merchant"),
                    Text(resulScanQris.name),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Lokasi Merchant"),
                    Text(resulScanQris.city),
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
