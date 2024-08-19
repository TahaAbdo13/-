import 'dart:async';
import 'package:financeapp/viewes/home_view.dart';
import 'package:financeapp/viewes/onboarding_view.dart';
import 'package:financeapp/widgets/splash_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static String id = "SplachScrren";
  @override
  State<SplashView> createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
Future<void> getvalue() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool isFirst = preferences.getBool('isFirst') ?? false;

    if (isFirst == false) {

      await preferences.setBool("isFirst", true);
      Navigator.popAndPushNamed(context, OnboardingView.id);
    } else {
   
      Navigator.popAndPushNamed(context, HomeView.id);
    }
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      getvalue();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreenBody(),
    );
  }
}
