import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/widgets/menu.icon.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  int _left = 25;
  int _right = 15;
  bool arrowFlag = false;

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
      'iconBackgroundColor': const Color.fromARGB(151, 37, 153, 43),
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
      'iconBackgroundColor': const Color.fromARGB(255, 100, 209, 85),
    },
    {
      'iconData': Icons.swipe_up_alt_sharp,
      'label': 'Setor Tarik',
      'iconBackgroundColor': const Color.fromARGB(255, 241, 120, 235),
    },
    {
      'iconData': Icons.access_alarms_sharp,
      'label': 'Tagihan',
      'iconBackgroundColor': Colors.brown[400],
    },
  ];

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels < 40) {
      // If at the maximum scroll position
      setState(() {
        _left = 25;
        _right = 15;
        arrowFlag = false;
      });
    } else {
      setState(() {
        _left = 15;
        _right = 25;
        arrowFlag = true;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              return Container(
                width: 80,
                height: 160,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    CustomIconBox(
                      iconData: dataList[index]['iconData'],
                      label: dataList[index]['label'],
                      iconBackgroundColor: dataList[index]
                          ['iconBackgroundColor'],
                    ),
                    CustomIconBox(
                      iconData: dataList2[index]['iconData'],
                      label: dataList2[index]['label'],
                      iconBackgroundColor: dataList2[index]
                          ['iconBackgroundColor'],
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 4,
            left: MediaQuery.of(context).size.width / 2 + 20,
            child: !arrowFlag
                ? IconButton(
                    onPressed: () {
                      _scrollController.animateTo(
                        6 * 80.0,
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                    ),
                  )
                : const SizedBox(),
          ),
          Positioned(
            bottom: 4,
            left: MediaQuery.of(context).size.width / 2 - 70,
            child: arrowFlag
                ? IconButton(
                    onPressed: () {
                      _scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                    ),
                  )
                : const SizedBox(),
          ),
          Positioned(
            bottom: 25,
            left: MediaQuery.of(context).size.width / 2 - 25,
            right: MediaQuery.of(context).size.width / 2 - 25,
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            left: MediaQuery.of(context).size.width / 2 - _left,
            right: MediaQuery.of(context).size.width / 2 - _right,
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
