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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            width: 80,
            height: 160,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: const BoxDecoration(color: Colors.white),
            child: const Column(
              children: [
                CustomIconBox(
                  iconData: Icons.attach_money,
                  label: 'e-money',
                  iconBackgroundColor: Colors.orange,
                ),
                CustomIconBox(
                  iconData: Icons.qr_code_scanner,
                  label: 'QR Terima Transfer',
                  iconBackgroundColor: Colors.blue,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
