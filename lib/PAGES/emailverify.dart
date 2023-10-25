import 'package:figma/PAGES/otpcalling.dart';
import 'package:figma/PAGES/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class Verification extends StatelessWidget {
  final id;
  final String email;
  final String password;
  Verification({
    super.key,
    required this.id,
    required this.email,
    required this.password,
  });

  apiCalling obje = apiCalling();

  var otpcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: const BackButton(
            color: Colors.black,
          ),
          elevation: 0,
          title: const Text(
            'Verification',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              ' Enter your \n Verification Code',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 30,
            ),
            Pinput(
              controller: otpcontroller,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                '04:59',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
                text: const TextSpan(children: <TextSpan>[
              (TextSpan(
                  text: '  We send verification code to your\n  email',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 18))),
              TextSpan(
                  text: '   brajaoma*****@gmail.com',
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.normal,
                      fontSize: 18)),
              TextSpan(
                  text: '. You can \n  check your inbox.',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 18))
            ])),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '  I didn’t received the code? Send again',
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 19,
                  decoration: TextDecoration.underline),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: ElevatedButton(
                onPressed: () async {
                  print(id);
                  var status = await obje
                      .verifyOtp(id, otpcontroller.text);

                  if (status == 'success') {
                    await Auth().createUserWithEmailAndPassword(
                        email, password, context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('incorrect OTP , try again'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.only(
                        left: 150, right: 150, top: 15, bottom: 15)),
                child: const Text(
                  'Verify',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// SAVING EMAIL TO FIREBASE

class Auth {
  createUserWithEmailAndPassword(
      String emailcontroller, String passwordcontroller, context) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller,
        password: passwordcontroller,
      );
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => homepage(),
          ),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      print(e);
    } catch (e) {
      print(e);
    }
  }
}
