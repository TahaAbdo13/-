import 'package:financeapp/constants.dart';
import 'package:financeapp/viewes/home_view.dart';
import 'package:financeapp/widgets/onboarding_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});
  static String id = "OnboardingView";

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController pageController = PageController();
  bool darkMode = Hive.box(darkModeBox).get("darkMode")??false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(HomeView.id, (rout) => false);
              },
              child: Text(
                "skip",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkMode ? Colors.white : Colors.black),
              ))
        ],
      ),
      body: OnboardingScreenBody(pageController: pageController, items: items),
    );
  }
}
