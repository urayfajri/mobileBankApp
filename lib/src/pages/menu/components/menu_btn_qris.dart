import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QrisFloatingButton extends StatelessWidget {
  const QrisFloatingButton({super.key, required this.onItemTapped});

  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: 75,
      height: 75,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: FloatingActionButton(
        heroTag: "BtnQRIS",
        elevation: 0,
        onPressed: () => {
          onItemTapped(2),
        },
        materialTapTargetSize: MaterialTapTargetSize.padded,
        backgroundColor: Colors.orange,
        shape: const CircleBorder(
          side: BorderSide(color: Color.fromARGB(255, 255, 225, 187), width: 5),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Icon(
              Icons.qr_code,
              color: Colors.white,
              size: 40,
            ),
            Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                'assets/images/logo_qris.svg',
                color: Colors.orange,
                width: 50,
                height: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
