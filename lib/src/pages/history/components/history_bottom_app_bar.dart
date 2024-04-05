import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/pages/history/components/result_search_history/result_search_history.dart';

class HistoryBottomAppBar extends StatelessWidget {
  const HistoryBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration:
                  const Duration(milliseconds: 800), // Durasi animasi
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = const Offset(1.0, 0.0);
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
                  const ResultSearchHistory(),
            ),
          );
        },
        child: const Text(
          "Selanjutnya",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
