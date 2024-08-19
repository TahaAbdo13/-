import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/svg/logo.svg"),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "مصروفاتي",
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                fontFamily: "Changa"),
          )
        ],
      ),
    );
  }
}
