import 'package:figma/PAGES/homepage.dart';
import 'package:figma/PAGES/signlog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class montra extends StatefulWidget {
  const montra({super.key});

  @override
  State<montra> createState() => _montraState();
}

class _montraState extends State<montra> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(seconds: 1), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => StreamBuilder(
                  // Provide the stream to listen to.
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (BuildContext context, snapshot) {
                    // Show a loading indicator.
                    if (snapshot.hasData) {
                      return homepage();
                    } else {
                      return signlog();
                      // Display the data from the stream.
                    }
                  },
                )));
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 127, 68, 231),
          body: Center(
            child: Stack(
              children: [
                Text(
                  'montra',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )),
    );
  }
}
