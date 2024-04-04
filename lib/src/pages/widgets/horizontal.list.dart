import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/widgets/menu.icon.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  List<Map<String, dynamic>> dataList = [
    {
      'iconData': Icons.attach_money,
      'label': 'e-money',
      'iconBackgroundColor': Colors.orange,
    },
    {
      'iconData': Icons.qr_code_scanner,
      'label': 'QR Terima Transfer',
      'iconBackgroundColor': Colors.blue,
    },
    {
      'iconData': Icons.attach_money,
      'label': 'e-money',
      'iconBackgroundColor': Colors.orange,
    },
    {
      'iconData': Icons.qr_code_scanner,
      'label': 'QR Terima Transfer',
      'iconBackgroundColor': Colors.blue,
    },
    {
      'iconData': Icons.attach_money,
      'label': 'e-money',
      'iconBackgroundColor': Colors.orange,
    },
    {
      'iconData': Icons.qr_code_scanner,
      'label': 'QR Terima Transfer',
      'iconBackgroundColor': Colors.blue,
    },
  ];

  List<Map<String, dynamic>> dataList2 = [
    {
      'iconData': Icons.attach_money,
      'label': 'Test',
      'iconBackgroundColor': Colors.orange,
    },
    {
      'iconData': Icons.qr_code_scanner,
      'label': 'QR Terima Transfer',
      'iconBackgroundColor': Colors.blue,
    },
    {
      'iconData': Icons.attach_money,
      'label': 'e-money',
      'iconBackgroundColor': Colors.orange,
    },
    {
      'iconData': Icons.qr_code_scanner,
      'label': 'QR Terima Transfer',
      'iconBackgroundColor': Colors.blue,
    },
    {
      'iconData': Icons.attach_money,
      'label': 'e-money',
      'iconBackgroundColor': Colors.orange,
    },
    {
      'iconData': Icons.qr_code_scanner,
      'label': 'QR Terima Transfer',
      'iconBackgroundColor': Colors.blue,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return Container(
            width: 80,
            height: 160,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                CustomIconBox(
                  iconData: dataList[index]['iconData'],
                  label: dataList[index]['label'],
                  iconBackgroundColor: dataList[index]['iconBackgroundColor'],
                ),
                CustomIconBox(
                  iconData: dataList2[index]['iconData'],
                  label: dataList2[index]['label'],
                  iconBackgroundColor: dataList2[index]['iconBackgroundColor'],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
