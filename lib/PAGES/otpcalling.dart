import 'dart:convert';
import 'package:figma/PAGES/mobnumverify.dart';
import 'package:figma/PAGES/homepage.dart';
import 'package:figma/PAGES/signlog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

// EMAIL

class apiCalling {
  sendingOTP(email) async {
    Uri requestUrl = Uri.parse(
        'https://malluscart.online/flutter-projects/expense-app/mail-verification/mailer.php?email=$email');
    final response = await http.get(requestUrl);
    var responseJson = json.decode(response.body.toString());
    return responseJson["id"];
  }

  verifyOtp(id, userOtp) async {
    Uri requestUrl = Uri.parse(
        'https://malluscart.online/flutter-projects/expense-app/mail-verification/verify-otp.php?id=$id&otp=$userOtp');
    final response = await http.get(requestUrl);
    var responseJson = json.decode(response.body.toString());
    print(response);
    return responseJson['status'];
  }
}

// MOBILE

class mobileAuth {
  sendOTP(phoneController, context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91$phoneController',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Phoneveri(
                verifi: verificationId,
              ),
            ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  verifyotp(pinput, context, id) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: id, smsCode: pinput);
    await auth
        .signInWithCredential(credential)
        .then((value) => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => homepage(),
            ),
            (route) => false));
  }
}

// GOOGLE

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

// SIGNOUT

signOut(context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => signlog()));
}
