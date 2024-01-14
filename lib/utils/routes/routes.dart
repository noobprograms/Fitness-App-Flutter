import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/utils/routes/routes_name.dart';
import 'package:flutter_fitness_app/view/home_screen.dart';
import 'package:flutter_fitness_app/view/onBoarding_screen.dart';
import 'package:flutter_fitness_app/view/splash_screen.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashScreen());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => OnBoardingScreen());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
