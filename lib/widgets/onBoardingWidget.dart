import 'package:flutter/material.dart';

class OnBoardingWidget extends StatelessWidget {
  OnBoardingWidget(
      {required this.image,
      required this.title,
      required this.subtitle,
      super.key});
  final image;
  final title;
  final subtitle;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 35, 37, 46),
          image: DecorationImage(
              image: image,
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
                    title,
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
                    subtitle,
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
          ],
        ),
      ),
    );
  }
}
