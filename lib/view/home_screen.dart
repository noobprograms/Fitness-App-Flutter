import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/utils/imageConstants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 35, 37, 46),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        height: screenHeight * 0.2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.grey[500]!, BlendMode.modulate),
                            image: AssetImage(ImageConstant.poseDetectionPic),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                            child: Text(
                          'Pose detection',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.03),
                        ))),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.02,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        width: screenWidth * 0.4,
                        height: screenHeight * 0.2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.grey[500]!, BlendMode.modulate),
                                image: AssetImage(
                                  ImageConstant.onBoarding3,
                                )),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: Text(
                          'Transformation',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.03),
                        ))),
                  ),
                )
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        width: screenWidth * 0.8,
                        height: screenHeight * 0.2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                colorFilter: ColorFilter.mode(
                                    Colors.grey[500]!, BlendMode.modulate),
                                fit: BoxFit.cover,
                                image: AssetImage(ImageConstant.onBoarding2)),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: Text(
                          'Exercise Tracker',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.03),
                        ))),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
