import 'package:figma/PAGES/function.dart';
import 'package:figma/PAGES/homepage.dart';
import 'package:figma/PAGES/otpcalling.dart';
import 'package:figma/PAGES/mobnumverify.dart';
import 'package:figma/PAGES/emailverify.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class signup extends StatelessWidget {
  signup({super.key});

  Auth obj = Auth();
  apiCalling obj1 = apiCalling();

  bool ischecked = false;

  var emailcontroller = TextEditingController();

  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<Functions>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Center(
            child: Padding(
              padding: EdgeInsets.only(right: 30),
              child: Text(
                'Sign up',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.visibility),
                    hintText: 'password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    value: provide.ischecked,
                    onChanged: (bool? value) {
                      provide.tru(value);
                    }),
                RichText(
                    text: const TextSpan(children: <TextSpan>[
                  (TextSpan(
                      text: 'By signing up,you agree to the',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold))),
                  TextSpan(
                      text: ' Terms Of\n Service and Privacy Policy',
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold))
                ]))
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                var id = await obj1.sendingOTP(emailcontroller.text);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Verification(
                              id: id,
                              password: passwordcontroller.text,
                              email: emailcontroller.text,
                            )));
              },
              child: const Text('Sign up'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.only(
                      left: 130, right: 130, top: 15, bottom: 15)),
            ),
            const SizedBox(height: 20),
            const Text(
              'Or with',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () async {
                await signInWithGoogle();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => homepage(),
                    ),
                    (route) => false);
              },
              child: const Text(
                'Sign up with Google',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.only(
                      left: 80, right: 80, top: 15, bottom: 15)),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Phone()));
              },
              child: const Text(
                'Sign up with Phone ',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.only(
                      left: 80, right: 80, top: 15, bottom: 15)),
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
                text: const TextSpan(children: <TextSpan>[
              (TextSpan(
                  text: 'Already have an account?',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15))),
              TextSpan(
                  text: 'Login',
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 15))
            ]))
          ],
        ),
      ),
    );
  }
}
