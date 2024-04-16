import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/history/components/history_app_bar.dart';
import 'package:mobile_bank_app/src/pages/history/components/result_search_history/widget/btn_download_history.dart';
import 'package:mobile_bank_app/src/pages/history/components/result_search_history/widget/table_history.dart';

class ResultSearchHistory extends StatefulWidget {
  const ResultSearchHistory({super.key});

  @override
  State<ResultSearchHistory> createState() => _ResultSearchHistory();
}

class _ResultSearchHistory extends State<ResultSearchHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HistoryAppBar(),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TableHistory(),
                      SizedBox(height: 10),
                      BtnPaginate(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      BtnDownloadHistory(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
