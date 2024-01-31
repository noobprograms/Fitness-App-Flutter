import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/providers/auth_provider.dart';

import 'package:flutter_fitness_app/widgets/onBoardingWidget.dart';
import 'package:flutter_fitness_app/utils/constants.dart';
import 'package:flutter_fitness_app/utils/imageConstants.dart';
import 'package:flutter_fitness_app/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

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
  int currentIndex = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
        body: Stack(alignment: Alignment.center, children: [
      PageView.builder(
          itemCount: onBoardingList.length + 1,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          itemBuilder: (context, index) {
            return index < 3
                ? OnBoardingWidget(
                    image: onBoardingList[index]['image'],
                    title: onBoardingList[index]['title'],
                    subtitle: onBoardingList[index]['subtitle'])
                : Container(
                    width: screenWidth,
                    height: screenHeight,
                    color: Color.fromARGB(255, 35, 37, 46),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.1,
                        ),
                        Text(
                          "Start Grinding!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: screenHeight * 0.05),
                        ),
                        SizedBox(
                          height: screenHeight * 0.1,
                        ),
                        Container(
                          width: screenWidth * 0.8,
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: "Enter Your Name",
                              hintStyle: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 149, 149, 149)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    30.0), // Adjust the radius for more or less curve
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.04,
                        ),
                        Container(
                          width: screenWidth * 0.8,
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: "Enter Your email",
                              hintStyle: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 149, 149, 149)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    30.0), // Adjust the radius for more or less curve
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.1,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Provider.of<AuthProvider>(context, listen: false)
                                .setEmailAndName(
                                    nameController.text, emailController.text);
                            Navigator.pushReplacementNamed(
                                context, RoutesName.emailVerificationScreen);
                          },
                          child: Text(
                            'Verify Email',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                        )
                      ],
                    ),
                  );
          }),
      currentIndex < 3
          ? Positioned.directional(
              textDirection: TextDirection.ltr,
              bottom: screenHeight * 0.01,
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(onBoardingList.length,
                        (index) => buildDot(index, context)),
                  )),
            )
          : Container()
    ]));
  }

  Container buildDot(int index, BuildContext context) {
    // Another Container returned
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red,
      ),
    );
  }
}
