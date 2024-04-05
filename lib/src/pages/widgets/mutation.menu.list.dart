import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/mutation.page.dart';
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CustomIconBox(
              iconData: Icons.attach_money,
              label: 'e-money',
              iconBackgroundColor: Colors.white),
          const SizedBox(width: 10),
          const CustomIconBox(
              iconData: Icons.flash_off_outlined,
              label: 'Quick Pick',
              iconBackgroundColor: Colors.white),
          const SizedBox(width: 10),
          const CustomIconBox(
              iconData: Icons.money_outlined,
              label: 'Setor Tarik',
              iconBackgroundColor: Colors.white),
          const SizedBox(width: 10),
          const CustomIconBox(
              iconData: Icons.money_outlined,
              label: 'Setor Tarik',
              iconBackgroundColor: Colors.white),
        ],
      ),
    );
  }
}
