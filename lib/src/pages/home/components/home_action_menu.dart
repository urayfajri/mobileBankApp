import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/home/components/home_btn_menu_card.dart';
import 'package:mobile_bank_app/src/providers/home_edit_menu.provider.dart';
import 'package:provider/provider.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class ActionMenuList extends StatelessWidget {
  const ActionMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ListActionButton(),
        _ActionItemsList(),
      ],
    );
  }
}

class _ListActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _UserPointInfo(),
          _BtnEditMenu(),
        ],
      ),
    );
  }
}

class _UserPointInfo extends StatelessWidget {
  const _UserPointInfo();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
            width: 2, color: const Color.fromARGB(255, 211, 211, 211)),
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: const Row(
        children: [
          Text(
            "Poin",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10),
          Text(
            "0",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _BtnEditMenu extends StatelessWidget {
  const _BtnEditMenu();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeEditMenuProvider>(
      builder: (context, provider, child) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: provider.editMenu ? Colors.green : Colors.orange,
                width: 2,
              ),
            ),
          ),
          onPressed: () => {
            provider.editMenu = !provider.editMenu,
          },
          child: Row(
            children: [
              Icon(
                Icons.edit_outlined,
                color: provider.editMenu ? Colors.green : Colors.orange,
                size: 15,
              ),
              const SizedBox(width: 10),
              Text(
                "Atur Menu",
                style: TextStyle(
                  color: provider.editMenu ? Colors.green : Colors.orange,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ActionItemsList extends StatefulWidget {
  @override
  _ActionItemsListState createState() => _ActionItemsListState();
}

class _ActionItemsListState extends State<_ActionItemsList> {
  final actionList = [
    {
      "backgroundColor": const Color.fromARGB(255, 202, 255, 141),
      "icon": Icons.compare_arrows,
      "iconColor": Colors.green,
      "text": "Transfer",
    },
    {
      "backgroundColor": const Color.fromARGB(255, 160, 225, 255),
      "icon": Icons.payment,
      "iconColor": Colors.blue,
      "text": "E-Wallet",
    },
    {
      "backgroundColor": const Color.fromARGB(255, 255, 211, 154),
      "icon": Icons.wallet,
      "iconColor": Colors.orange,
      "text": "Pembayaran",
    },
    {
      "backgroundColor": const Color.fromARGB(255, 255, 178, 172),
      "icon": Icons.paypal,
      "iconColor": Colors.red,
      "text": "Pembelian",
    },
    {
      "backgroundColor": const Color.fromARGB(255, 162, 241, 233),
      "icon": Icons.payments,
      "iconColor": Colors.teal,
      "text": "Investasi",
    },
    {
      "backgroundColor": const Color.fromARGB(255, 255, 192, 213),
      "icon": Icons.add_card,
      "iconColor": Colors.pink,
      "text": "Life Goals",
    },
    {
      "backgroundColor": const Color.fromARGB(255, 218, 216, 216),
      "icon": Icons.pending_actions,
      "iconColor": Colors.grey,
      "text": "Digital Loan",
    },
    {
      "backgroundColor": const Color.fromARGB(255, 172, 244, 253),
      "icon": Icons.phone_android,
      "iconColor": Colors.cyan,
      "text": "My Credit Card",
    },
    {
      "backgroundColor": const Color.fromARGB(255, 255, 249, 198),
      "icon": Icons.attach_money,
      "iconColor": Colors.yellow,
      "text": "Rekeningku",
    },
    {
      "backgroundColor": const Color.fromARGB(255, 255, 249, 198),
      "icon": Icons.attach_money,
      "iconColor": Colors.yellow,
      "text": "Dikado",
    },
    {
      "backgroundColor": const Color.fromARGB(255, 255, 249, 198),
      "icon": Icons.attach_money,
      "iconColor": Colors.yellow,
      "text": "Rekeningku",
    },
    {
      "backgroundColor": const Color.fromARGB(255, 210, 235, 255),
      "icon": Icons.apps,
      "iconColor": Colors.blue,
      "text": "More",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeEditMenuProvider>(
      builder: (context, provider, _) {
        return ReorderableGridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          dragEnabled: provider.editMenu,
          physics: const NeverScrollableScrollPhysics(),
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              final element = actionList.removeAt(oldIndex);
              actionList.insert(newIndex, element);
            });
          },
          children: actionList.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, dynamic> item = entry.value;
            return HomeBtnMenuCard(
              key: ValueKey(index),
              backgroundColor: item['backgroundColor'] as Color,
              icon: item['icon'] as IconData,
              iconColor: item['iconColor'] as Color,
              text: item['text'] as String,
            );
          }).toList(),
        );
      },
    );
  }
}
