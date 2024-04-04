import 'package:flutter/material.dart';

class HeaderImage extends StatefulWidget {
  const HeaderImage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HeaderImageState createState() => _HeaderImageState();
}

class _HeaderImageState extends State<HeaderImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
