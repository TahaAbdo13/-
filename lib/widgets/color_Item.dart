import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  final bool isActive;
  final Color color;
  const ColorItem({super.key, required this.color, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 36,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 34,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 34,
          );
  }
}
