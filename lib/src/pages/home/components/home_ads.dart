import 'package:flutter/material.dart';

class HomeAds extends StatelessWidget {
  const HomeAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
          child: const Text(
            "Promo & Informasi",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                width: 300,
                height: 200,
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 200,
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 200,
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
