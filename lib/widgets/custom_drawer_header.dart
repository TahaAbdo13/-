import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DrawerHeader(
        child: Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.lightBlue,
          child: Text(
            "T",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
         SizedBox(
          height: 5,
        ),
        Text(
          "Taha Abdo",
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    ));
  }
}
