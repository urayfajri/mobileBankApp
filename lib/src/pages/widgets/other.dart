import 'package:flutter/material.dart';

class Other extends StatefulWidget {
  const Other({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OtherState createState() => _OtherState();
}

class _OtherState extends State<Other> {
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
                "Other",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.blue[900]),
              ),
            ],
          ),
        ),
        Stack(children: [
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
                          'https://ik.imagekit.io/fdu5ptj23co/000071-05_jenis-jenis-kartu-atm-mandiri_gold-gpn_800x450_ccpdm-min%20(2)_A-b415Vdu.jpg'),
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
              padding: const EdgeInsets.all(30),
              width: 290,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tabungan Mandiri',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '071237463527',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          )
        ]),
        const SizedBox(height: 20),
        Stack(children: [
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
                          'https://ik.imagekit.io/fdu5ptj23co/000071-05_jenis-jenis-kartu-atm-mandiri_gold-gpn_800x450_ccpdm-min%20(2)_A-b415Vdu.jpg'),
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
              padding: const EdgeInsets.all(30),
              width: 290,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tabungan Mandiri',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '071237463527',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          )
        ]),
        const SizedBox(height: 20),
      ],
    );
  }
}
