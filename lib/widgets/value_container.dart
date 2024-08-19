import 'package:flutter/material.dart';

class ValueContainer extends StatefulWidget {
  final String num;
  final bool isPlus;
  const ValueContainer({
    super.key,
    required this.num,
    required this.isPlus,
  });

  @override
  State<ValueContainer> createState() => _ValueContainerState();
}

class _ValueContainerState extends State<ValueContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: widget.isPlus ? Colors.lightGreenAccent : Colors.redAccent),
        width: double.infinity,
        child: Center(
          child: Text(
            widget.isPlus
                ? (widget.num == "" ? "+ 0.0" : "+ ${widget.num}")
                : (widget.num == "" ? "- 0.0" : "- ${widget.num}"),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
