import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/mutation.page.dart';

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
          padding:
              const EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 20),
          margin: const EdgeInsets.only(bottom: 0),
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
        ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 20, bottom: 0),
          itemCount: 2,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 600),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin = const Offset(0.0, 1.0);
                        var end = Offset.zero;
                        var curve = Curves.ease;
                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const MutationPage(),
                    ));
              },
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        const Spacer(),
                        Container(
                          height: 115,
                          width: 90,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://ik.imagekit.io/fdu5ptj23co/000071-05_jenis-jenis-kartu-atm-mandiri_gold-gpn_800x450_ccpdm-min%20(2)_A-b415Vdu.jpg',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      width: 290,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Tabungan Mandiri',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Text(
                            '13211231232',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            _isBalanceVisible
                                ? 'RP. 15.000.000'
                                : '***********',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 3),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
