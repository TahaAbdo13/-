import 'package:flutter/material.dart';

class CustomElvatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final Color color;
  final bool isLoading;
  const CustomElvatedButton({
    super.key,
    this.onPressed,
    required this.title,
    required this.color,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(20)),
      child: isLoading == true
          ? const CircularProgressIndicator(
              color: Colors.black,
            )
          : Text(title),
    );
  }
}
