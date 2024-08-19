import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {

final  void Function()? onTap;
final Widget trailing;
  final String title;
  const DrawerListTile({
    super.key,
    required this.title,  this.onTap, required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title:  Text(title),
        trailing: trailing,
      ),
    );
  }
}
