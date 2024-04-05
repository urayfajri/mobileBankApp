import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/history/components/input/history_period_radio.dart';

class HistoryPeriod extends StatelessWidget {
  const HistoryPeriod({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pilih Periode Pencarian",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          HistoryPeriodRadio(),
        ],
      ),
    );
  }
}
