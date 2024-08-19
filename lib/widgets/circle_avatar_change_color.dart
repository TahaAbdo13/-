import 'package:financeapp/widgets/onboarding_screen_body.dart';
import 'package:flutter/material.dart';

class CircleAvatarChangeColor extends StatelessWidget {
  const CircleAvatarChangeColor({
    super.key,
    required this.widget,
    required this.currentIndex,
  });

  final OnboardingScreenBody widget;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 2 * 5,
        child: Row(
          children: [
            SizedBox(
              width: 150,
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.items.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 3.0),
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor:
                            currentIndex == i ? Colors.blue : Colors.grey[400],
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
