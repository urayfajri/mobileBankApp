import 'package:flutter/material.dart';

class HistoryTransactionSelect extends StatefulWidget {
  const HistoryTransactionSelect({super.key});

  @override
  State<HistoryTransactionSelect> createState() =>
      _HistoryTransactionSelectState();
}

class _HistoryTransactionSelectState extends State<HistoryTransactionSelect> {
  String selectedMenu = "history";

  void setSelectedMenu() {
    setState(() {
      if (selectedMenu == "history") {
        selectedMenu = "proof";
      } else {
        selectedMenu = "history";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 218, 218, 218),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ButtonSelectTransaction(
            menu: "history",
            selectedMenu: selectedMenu,
            setSelectedMenu: setSelectedMenu,
            text: "Histori Transaksi",
          ),
          const SizedBox(width: 20),
          _ButtonSelectTransaction(
            menu: "proof",
            selectedMenu: selectedMenu,
            setSelectedMenu: setSelectedMenu,
            text: "Bukti Transaksi",
          ),
        ],
      ),
    );
  }
}

class _ButtonSelectTransaction extends StatelessWidget {
  const _ButtonSelectTransaction({
    required this.selectedMenu,
    required this.setSelectedMenu,
    required this.text,
    required this.menu,
  });

  final String menu;
  final String text;
  final String selectedMenu;
  final Function() setSelectedMenu;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: selectedMenu == menu
              ? const Color.fromARGB(255, 25, 134, 98)
              : Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        onPressed: () {
          setSelectedMenu();
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: selectedMenu == menu ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
