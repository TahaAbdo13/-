
import 'package:financeapp/widgets/custom_pageview_item.dart';
import 'package:flutter/material.dart';

import 'circle_avatar_change_color.dart';
import 'custom_elvated_button.dart';

class OnboardingScreenBody extends StatefulWidget {
  const OnboardingScreenBody({
    super.key,
    required this.pageController,
    required this.items,
  });

  final PageController pageController;
  final List<CustomPageViewItem> items;

  @override
  State<OnboardingScreenBody> createState() => _OnboardingScreenBodyState();
}

class _OnboardingScreenBodyState extends State<OnboardingScreenBody> {
  int currentIndex = 0;
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          Expanded(
              child: PageView.builder(
            onPageChanged: (value) {
              currentIndex = value;
              if (value + 1 == widget.items.length) {
                setState(() {
                  isLastPage = true;
                });
              } else {
                setState(() {
                  isLastPage = false;
                });
              }
            },
            controller: widget.pageController,
            itemCount: widget.items.length,
            itemBuilder: (context, index) => widget.items[index],
          )),
          CircleAvatarChangeColor(widget: widget, currentIndex: currentIndex),
          SizedBox(
            height: 30,
          ),
          CustomElvatedButton(isLastPage: isLastPage, widget: widget),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
