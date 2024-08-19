import 'package:financeapp/viewes/all_activity.dart';
import 'package:flutter/material.dart';

class RowSeeAllActivity extends StatelessWidget {
  const RowSeeAllActivity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Activity",
          style: TextStyle(
               fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AllActivity.id);
          },
          child: const Text(
            "See All",
            style: TextStyle( fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
