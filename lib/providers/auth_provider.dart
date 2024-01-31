import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/utils/routes/routes_name.dart';

class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;

  var name;
  var email;

  String get getEmail => email;
  String get getName => name;

  void initAuthScreen(BuildContext context, User? user) {
    if (user != null) {
      if (user.emailVerified) {
        Navigator.pushReplacementNamed(context, RoutesName.home);
      } else {
        name = user.displayName;
        email = user.email;
        Navigator.pushReplacementNamed(
            context, RoutesName.emailVerificationScreen);
      }
    } else
      Navigator.pushReplacementNamed(context, RoutesName.onBoardingScreen);
  }

  void setEmailAndName(String n, String e) {
    name = n;
    email = e;
    notifyListeners();
  }

  Future<void> sendSignInLink() async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: 'abcdefghijklmnop');
      if (authResult != null) {
        // Send email verification
        await _auth.currentUser?.sendEmailVerification();
      } else
        print('you are dead!');
    } catch (e) {
      print('Error sending email verification: $e');
    }
  }
}
