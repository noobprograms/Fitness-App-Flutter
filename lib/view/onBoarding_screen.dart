import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/utils/constants.dart';
import 'package:flutter_fitness_app/utils/imageConstants.dart';
import 'package:flutter_fitness_app/utils/routes/routes_name.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late AssetImage assetImage1;
  late AssetImage assetImage2;
  late AssetImage assetImage3;

  int onBoardingIndex = 0;
  bool first = true;
  List<Map<String, dynamic>> onBoardingList = [];
  @override
  void initState() {
    assetImage1 = AssetImage(ImageConstant.onBoarding1);
    assetImage2 = AssetImage(ImageConstant.onBoarding2);
    assetImage3 = AssetImage(ImageConstant.onBoarding3);
    onBoardingList = [
      {
        'title': onBoardingText1,
        'subtitle': onBoardingSubtitle1,
        'image': assetImage1
      },
      {
        'title': onBoardingText2,
        'subtitle': onBoardingSubtitle2,
        'image': assetImage2
      },
      {
        'title': onBoardingText3,
        'subtitle': onBoardingSubtitle3,
        'image': assetImage3,
      }
    ];
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(assetImage1, context);
    precacheImage(assetImage2, context);
    precacheImage(assetImage3, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 35, 37, 46),
            image: DecorationImage(
                image: onBoardingList[onBoardingIndex]['image'],
                colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      onBoardingList[onBoardingIndex]['title'],
                      maxLines: 3,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * 0.05),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      onBoardingList[onBoardingIndex]['subtitle'],
                      maxLines: 3,
                      style: TextStyle(
                          color: Color.fromARGB(255, 192, 190, 190),
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * 0.02),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  first
                      ? Container()
                      : ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (onBoardingIndex == 1) {
                                onBoardingIndex -= 1;
                                first = true;
                              } else
                                onBoardingIndex -= 1;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 163, 43, 34)),
                          child: Text(
                            'Previous',
                            style: TextStyle(color: Colors.white),
                          )),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          first = false;
                          if (onBoardingIndex == 2)
                            Navigator.pushReplacementNamed(
                                context, RoutesName.home);
                          else
                            onBoardingIndex += 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 163, 43, 34)),
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
