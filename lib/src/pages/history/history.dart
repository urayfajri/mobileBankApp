import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/history/components/input/history_account_select.dart';
import 'package:mobile_bank_app/src/pages/history/components/history_app_bar.dart';
import 'package:mobile_bank_app/src/pages/history/components/history_bottom_app_bar.dart';
import 'package:mobile_bank_app/src/pages/history/components/input/history_period.dart';
import 'package:mobile_bank_app/src/pages/history/components/input/history_transaction_select.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HistoryAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            children: [
              HistoryAccountSelect(),
              SizedBox(height: 20),
              HistoryTransactionSelect(),
              SizedBox(height: 20),
              HistoryPeriod(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HistoryBottomAppBar(),
    );
  }
}
