import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class SimpleBanner extends StatefulWidget {
  const SimpleBanner({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SimpleBannerState createState() => _SimpleBannerState();
}

class _SimpleBannerState extends State<SimpleBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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
      child: Row(
        children: [
          Image.network(
            'https://ik.imagekit.io/fdu5ptj23co/pngtree-jogging-clipart-cartoon-young-boy-running-in-the-fitness-vector-png-image_11068859_BfAAx_P_v.png',
            height: 150,
            width: 150,
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.zero,
            padding: const EdgeInsets.all(0),
            constraints: const BoxConstraints(minWidth: 240, minHeight: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: Text(
                    'ads-text'.i18n(),
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                Container(
                  constraints:
                      const BoxConstraints(maxWidth: 200, minWidth: 200),
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    child: Text('ads-button'.i18n()),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
