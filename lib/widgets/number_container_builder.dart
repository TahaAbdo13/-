import 'package:flutter/material.dart';

class NumberContainer extends StatefulWidget {
  final void Function() onTap;
  final String text;
  const NumberContainer({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  State<NumberContainer> createState() => _NumberContainerState();
}

class _NumberContainerState extends State<NumberContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: AlignmentDirectional.center,
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          widget.text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
    );
  }
}
