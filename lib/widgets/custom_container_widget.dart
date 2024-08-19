import 'package:flutter/material.dart';

class CustomContainerWidget extends StatefulWidget {
  final double topLeft, topRight, bottomLeft, bottomRight;
  final String title, totalPalance;
  final Color color;

  const CustomContainerWidget({
    super.key,
    required this.topLeft,
    required this.topRight,
    required this.bottomLeft,
    required this.bottomRight,
    required this.totalPalance,
    required this.title,
    required this.color,
  });

  @override
  State<CustomContainerWidget> createState() => _CustomContainerWidgetState();
}

class _CustomContainerWidgetState extends State<CustomContainerWidget> {
  @override
  Widget build(BuildContext context) {
    debugPrint(
        "========= Custom container widget ==================================================");
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.topLeft),
            topRight: Radius.circular(widget.topRight),
            bottomLeft: Radius.circular(widget.bottomLeft),
            bottomRight: Radius.circular(widget.bottomRight),
          ),
          color: Colors.black,
          border: Border(right: BorderSide(width: 70, color: widget.color))),
      width: double.infinity,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${widget.totalPalance}",
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
