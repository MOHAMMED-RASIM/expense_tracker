import 'package:figma/PAGES/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget {
  login({super.key});

  // Auth obj = Auth();

  var emaillogin = TextEditingController();

  var passwordlogin = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                'Login',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                controller: emaillogin,
                decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                controller: passwordlogin,
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.visibility),
                    hintText: 'password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () async {
                  try {
                    final credential =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emaillogin.text,
                      password: passwordlogin.text,
                    );
                    if (credential == credential) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => homepage(),
                          ),
                          (route) => false);
                      // User? user = credential.user;
                    }
                  } catch (e) {
                    if (e == e) {
                      // Show a Snackbar with a message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Email not found. Please check your email.'),
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.only(
                        left: 130, right: 130, top: 15, bottom: 15)),
                child: const Text('Login')),
            const SizedBox(height: 30),
            const Text(
              'Forget Password?',
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(height: 30),
            RichText(
                text: const TextSpan(children: <TextSpan>[
              (TextSpan(
                  text: 'Dont have an account yet?',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 17))),
              TextSpan(
                  text: 'Sign Up',
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 17))
            ]))
          ],
        ),
      ),
    );
  }
}
