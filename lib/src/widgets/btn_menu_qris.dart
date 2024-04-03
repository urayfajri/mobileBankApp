import 'package:flutter/material.dart';

class BtnMenuQris extends StatefulWidget {
  const BtnMenuQris({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BtnMenuQrisState createState() => _BtnMenuQrisState();
}

class _BtnMenuQrisState extends State<BtnMenuQris> {
  final List<bool> _isClickedList = [
    false,
    false,
    false
  ]; // Initialize with 3 buttons

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: BtnMenu(
                onTap: () => _toggleClickedState(0),
                isClicked: _isClickedList[0],
                btnLabel: 'Scan QR',
              ),
            ),
            Expanded(
              child: BtnMenu(
                onTap: () => _toggleClickedState(1),
                isClicked: _isClickedList[1],
                btnLabel: 'Kode Bayar',
              ),
            ),
            Expanded(
              child: BtnMenu(
                onTap: () => _toggleClickedState(2),
                isClicked: _isClickedList[2],
                btnLabel: 'Terima Dana',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleClickedState(int index) {
    setState(() {
      _isClickedList[index] = !_isClickedList[index];
    });
  }
}

class BtnMenu extends StatelessWidget {
  final VoidCallback onTap;
  final bool isClicked;
  final String btnLabel;

  const BtnMenu({
    super.key,
    required this.onTap,
    required this.isClicked,
    required this.btnLabel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isClicked
              ? const Color.fromARGB(255, 255, 142, 44)
              : Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                btnLabel,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isClicked
                        ? Colors.white
                        : const Color.fromARGB(255, 255, 142, 44)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
