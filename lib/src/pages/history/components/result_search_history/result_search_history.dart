import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[300], // Color of the bottom border
            height: 0.8, // Thickness of the bottom border
          ),
        ),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Riwayat',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 18.0,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.house,
              color: Colors.orange,
              size: 30,
            ),
            onPressed: () {
              print("item Pressed");
            },
          ),
        ],
      ),
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
