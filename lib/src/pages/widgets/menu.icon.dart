import 'package:flutter/material.dart';

class CustomIconBox extends StatefulWidget {
  final IconData iconData;
  final String label;
  final Color iconBackgroundColor;

  const CustomIconBox({
    super.key,
    required this.iconData,
    required this.label,
    required this.iconBackgroundColor,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomIconBoxState createState() => _CustomIconBoxState();
}

class _CustomIconBoxState extends State<CustomIconBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: widget.iconBackgroundColor,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(widget.iconData,
                size: 30,
                color: widget.iconBackgroundColor != Colors.white
                    ? Colors.white
                    : Colors.blue),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          constraints: const BoxConstraints(maxWidth: 60, minWidth: 60),
          height: 35,
          child: Text(widget.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: widget.iconBackgroundColor != Colors.white
                      ? Colors.black
                      : Colors.white)),
        ),
      ],
    );
  }
}
