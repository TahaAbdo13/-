import 'package:financeapp/constants.dart';
import 'package:financeapp/viewes/home_view.dart';
import 'package:financeapp/widgets/onboarding_screen_body.dart';
import 'package:flutter/material.dart';
class CustomElvatedButton extends StatefulWidget {
  const CustomElvatedButton({
    super.key,
    required this.isLastPage,
    required this.widget,
  });

  final bool isLastPage;
  final OnboardingScreenBody widget;

  @override
  State<CustomElvatedButton> createState() => _CustomElvatedButtonState();
}

class _CustomElvatedButtonState extends State<CustomElvatedButton> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: widget.isLastPage ? kPrimaryBlue : kPrimaryGreen,
            foregroundColor: kPrimaryWhit,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () async {
          widget.isLastPage
              ? Navigator.of(context)
                  .pushNamedAndRemoveUntil(HomeView.id, (rout) => false)
              : widget.widget.pageController.nextPage(
                  duration: (const Duration(microseconds: 700)),
                  curve: Curves.decelerate);
         
        },
        child: Text(widget.isLastPage ? "getStarted" : "Next"));
  }
}
