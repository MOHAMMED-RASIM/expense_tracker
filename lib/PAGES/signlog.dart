import 'package:figma/PAGES/login.dart';
import 'package:figma/PAGES/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class signlog extends StatelessWidget {
  signlog({super.key});

  final List<Widget> slider = [slider1(), slider2(), slider3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: CarouselSlider.builder(
                enableAutoSlider: true,
                autoSliderTransitionTime: const Duration(seconds: 1),
                unlimitedMode: true,
                slideIndicator: CircularSlideIndicator(
                    currentIndicatorColor: Colors.deepPurple),
                slideBuilder: (index) {
                  return slider[index];
                },
                itemCount: 3),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => signup()));
            },
            child: const Text('Sign up'),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.only(
                    left: 130, right: 130, top: 15, bottom: 15)),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => login(),
                  ));
            },
            child: const Text('Log in'),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                padding: const EdgeInsets.only(
                    left: 130, right: 130, top: 15, bottom: 15)),
          )
        ],
      ),
    );
  }
}

Widget slider1() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        'assets/hand.png',
        scale: 1.5,
      ),
      const Text(
        'Gain total control\n of your money',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 30),
      const Text('Become your own money manager\n and make every cent count'),
    ],
  );
}

Widget slider2() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        'assets/paper.png',
        scale: 1.5,
      ),
      const Text(
        'Know where your\n money goes',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 30),
      const Text(
          'Track your transaction easily,\nwith categories and financial report')
    ],
  );
}

Widget slider3() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        'assets/plan.png',
        scale: 1.5,
      ),
      const Text(
        'Planning ahead',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 30),
      const Text('Setup your budget for each category\nso you in control')
    ],
  );
}
