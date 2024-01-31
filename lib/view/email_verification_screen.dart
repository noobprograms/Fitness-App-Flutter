import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/providers/auth_provider.dart' as authP;
import 'package:flutter_fitness_app/utils/imageConstants.dart';
import 'package:flutter_fitness_app/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<authP.AuthProvider>(context, listen: false).sendSignInLink();
    setPeriodicTimer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setPeriodicTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final newUser = FirebaseAuth.instance.currentUser;
      if (newUser?.emailVerified ?? false) {
        timer.cancel();
        Navigator.pushReplacementNamed(context, RoutesName.home);
      } else
        print('still not verified');
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 35, 37, 46),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.2,
              ),
              Container(
                width: screenWidth * 0.2,
                height: screenWidth * 0.2,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.verifyEmail))),
              ),
              SizedBox(
                height: screenHeight * 0.08,
              ),
              Container(
                child: Text(
                  'Verify Your Email',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.05,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Container(
                width: 0.8 * screenWidth,
                child: Text(
                  "We have sent a verification link to your entered email. Click the link and return to the app to continue.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
