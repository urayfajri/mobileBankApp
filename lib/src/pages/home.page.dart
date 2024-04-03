import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/login.page.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String name = 'SIAPA ITU NAMANYA';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 223, 237, 248), Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                padding: const EdgeInsets.only(top: 20, left: 160, right: 160),
                child: Image.network(
                  'https://ik.imagekit.io/fdu5ptj23co/f132e326-9f22-4136-83f3-1712e0a223d4_DYZ8c2Are.png',
                  height: 100,
                  width: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SELAMAT SIANG, ',
                      style: TextStyle(color: Colors.blue[900], fontSize: 14),
                    ),
                    Text(
                      '$name...!',
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 223, 237, 248), Colors.white],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                constraints: const BoxConstraints(
                  maxWidth: 700,
                ),
                child: Row(children: [
                  Image.network(
                    'https://ik.imagekit.io/fdu5ptj23co/pngtree-jogging-clipart-cartoon-young-boy-running-in-the-fitness-vector-png-image_11068859_BfAAx_P_v.png',
                    height: 150,
                    width: 150,
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.zero,
                    padding: const EdgeInsets.all(0),
                    constraints:
                        const BoxConstraints(minWidth: 240, minHeight: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            constraints: const BoxConstraints(maxWidth: 200),
                            child: const Text(
                              'Mau transfer, bayar dan top up lebih cepat?',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            )),
                        Container(
                            constraints: const BoxConstraints(
                                maxWidth: 200, minWidth: 200),
                            padding: const EdgeInsets.all(10),
                            child: ElevatedButton(
                              onPressed: () {
                                // Add your onPressed logic here
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blue, // Text color
                              ),
                              child: const Text('Atur Sekarang'),
                            ))
                      ],
                    ),
                  )
                ]),
              ),
              Container(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: const LoginPage(),
                    ),
                  );
                },
                child: const Text('Navigate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
