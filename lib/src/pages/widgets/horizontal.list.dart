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
      'iconData': Icons.payments_outlined,
      'label': 'Transfer',
      'iconBackgroundColor': Colors.greenAccent,
    },
    {
      'iconData': Icons.receipt_long_outlined,
      'label': 'Bayar',
      'iconBackgroundColor': Colors.lightBlueAccent,
    },
    {
      'iconData': Icons.send_to_mobile_sharp,
      'label': 'Top-up',
      'iconBackgroundColor': Color.fromARGB(151, 37, 153, 43),
    },
    {
      'iconData': Icons.attach_money,
      'label': 'e-money',
      'iconBackgroundColor': Colors.orangeAccent,
    },
    {
      'iconData': Icons.shopping_bag_outlined,
      'label': 'Sukha',
      'iconBackgroundColor': Colors.purpleAccent,
    },
    {
      'iconData': Icons.qr_code_scanner,
      'label': 'Scan QR',
      'iconBackgroundColor': Colors.blue,
    },
  ];

  List<Map<String, dynamic>> dataList2 = [
    {
      'iconData': Icons.settings_backup_restore_rounded,
      'label': 'Valas',
      'iconBackgroundColor': Colors.green[200],
    },
    {
      'iconData': Icons.qr_code_scanner,
      'label': 'QR Terima Transfer',
      'iconBackgroundColor': Colors.blue,
    },
    {
      'iconData': Icons.qr_code_2_sharp,
      'label': 'QR Bayar',
      'iconBackgroundColor': Colors.blue[400],
    },
    {
      'iconData': Icons.trending_up_rounded,
      'label': 'Investasi',
      'iconBackgroundColor': Color.fromARGB(255, 100, 209, 85),
    },
    {
      'iconData': Icons.swipe_up_alt_sharp,
      'label': 'Setor Tarik',
      'iconBackgroundColor': Color.fromARGB(255, 241, 120, 235),
    },
    {
      'iconData': Icons.access_alarms_sharp,
      'label': 'Tagihan',
      'iconBackgroundColor': Colors.brown[400],
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
