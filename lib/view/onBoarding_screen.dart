import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/utils/imageConstants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
          tag: ImageConstant.logo,
          child: Center(
            child: Image.asset(
              ImageConstant.logo,
              width: 50,
              height: 50,
            ),
          )),
    );
  }
}
