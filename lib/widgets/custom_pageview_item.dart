import 'package:flutter/material.dart';

class CustomPageViewItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  const CustomPageViewItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
          child: Image.asset(
        image,
      )),
      Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 35.0),
        child: Text(
          subTitle,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ),
    ]);
  }
}
