import 'package:flutter/material.dart';

class ChatUsFloatingButton extends StatelessWidget {
  const ChatUsFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      right: 20,
      child: SizedBox(
        height: 60,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.blue,
            elevation: 0,
            onPressed: () {
              print("Button Pressed!");
            },
            child: const _ChatUsFloatingButtonContent(),
          ),
        ),
      ),
    );
  }
}

class _ChatUsFloatingButtonContent extends StatelessWidget {
  const _ChatUsFloatingButtonContent();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            "Chat Us",
            style: TextStyle(
              color: Colors.white,
              height: 1,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const _AgentIcon(),
        Positioned(
          right: 19,
          bottom: -15,
          child: CustomPaint(
            size: const Size(20, 10),
            painter: _TrianglePainter(),
          ),
        ),
      ],
    );
  }
}

class _AgentIcon extends StatelessWidget {
  const _AgentIcon();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -30,
      right: -15,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 7,
        ),
        decoration: const BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: const Icon(
          Icons.support_agent,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue // Set the color of the triangle
      ..style = PaintingStyle.fill; // Set the painting style to fill

    final path = Path();
    path.moveTo(0, 0); // Move to the top-left corner
    path.lineTo(size.width, 0); // Draw a line to the top-right corner
    path.lineTo(
        size.width / 2, size.height); // Draw a line to the bottom center
    path.close(); // Close the path to form a triangle

    canvas.drawPath(path, paint); // Draw the triangle on the canvas
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No need to repaint since the shape is static
  }
}
