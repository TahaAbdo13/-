import 'package:financeapp/viewes/addview.dart';
import 'package:flutter/material.dart';

class CustomRowHomViewBody extends StatelessWidget {
  const CustomRowHomViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const Addview(
                isPlus: true,
              );
            }));
          },
          child: Container(
            width: 170,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(20)),
            child: const Padding(
              padding: EdgeInsets.only(left: 6),
              child: Row(
                children: [
                  Icon(Icons.add),
                  Text(
                    "Plus",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const Addview(
                isPlus: false,
              );
            }));
          },
          child: Container(
            width: 170,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(20)),
            child: const Padding(
              padding: EdgeInsets.only(left: 6),
              child: Row(
                children: [
                  Icon(Icons.remove),
                  Text(
                    "minus",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
