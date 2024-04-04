import 'package:flutter/material.dart';

class SavingAndDeposite extends StatefulWidget {
  const SavingAndDeposite({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SavingAndDepositeState createState() => _SavingAndDepositeState();
}

class _SavingAndDepositeState extends State<SavingAndDeposite> {
  bool _isBalanceVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isBalanceVisible = !_isBalanceVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              Text(
                "Tabungan & Deposito",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.blue[900]),
              ),
              const Spacer(),
              Row(
                children: [
                  GestureDetector(
                    onTap: _toggleVisibility,
                    child: Icon(
                      _isBalanceVisible
                          ? Icons.visibility
                          : Icons.visibility_off_rounded,
                      size: 20,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text('Saldo'),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 6),
                  const Text('Atur')
                ],
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 1)),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                width: 290,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tabungan Mandiri',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      _isBalanceVisible ? '071237463527' : '***********',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: 115,
                width: 80,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://ik.imagekit.io/fdu5ptj23co/000071-05_jenis-jenis-kartu-atm-mandiri_gold-gpn_800x450_ccpdm-min%20(2)_A-b415Vdu.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
