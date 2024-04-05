import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/widgets/menu.icon.dart';

class MutationIconList extends StatefulWidget {
  const MutationIconList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MutationIconListState createState() => _MutationIconListState();
}

class _MutationIconListState extends State<MutationIconList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomIconBox(
              iconData: Icons.arrow_circle_right_outlined,
              label: 'Transfer Rupiah',
              iconBackgroundColor: Colors.white),
          SizedBox(width: 10),
          CustomIconBox(
              iconData: Icons.receipt_long_rounded,
              label: 'Bayar',
              iconBackgroundColor: Colors.white),
          SizedBox(width: 10),
          CustomIconBox(
              iconData: Icons.wallet,
              label: 'Top-up',
              iconBackgroundColor: Colors.white),
          SizedBox(width: 10),
          CustomIconBox(
              iconData: Icons.credit_card,
              label: 'Kartu Fisik/Virtual',
              iconBackgroundColor: Colors.white),
        ],
      ),
    );
  }
}
