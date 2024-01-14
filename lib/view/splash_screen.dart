import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/utils/imageConstants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Color.fromARGB(255, 35, 37, 46),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Image.asset(ImageConstant.logo))],
      ),
    );
  }
}
