import 'package:financeapp/constants.dart';
import 'package:flutter/material.dart';

class DetailsContainer extends StatelessWidget {
   

  final void Function(String)? onChanged;

  const DetailsContainer({
    super.key, this.onChanged,
 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: kPrimaryBlue),
        width: double.infinity,
        child: TextFormField(
          onChanged: onChanged,
        
          style:const TextStyle(color: Colors.lightGreenAccent),
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: "Details Here..."),
        ));
  }
}
