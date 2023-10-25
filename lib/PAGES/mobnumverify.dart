import 'package:figma/PAGES/otpcalling.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class Phone extends StatelessWidget {
  Phone({super.key});

  var phoneotpcontroller = TextEditingController();
  mobileAuth obj = mobileAuth();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            'OTP verification',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
            child: TextField(
              controller: phoneotpcontroller,
              maxLength: 10,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(top: 12, left: 9),
                    child: Text(
                      '+91',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1)),
                  hintText: (' | Enter your phone number'),
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 366,
            height: 55,
            child: ElevatedButton(
              onPressed: () async {
                obj.sendOTP(phoneotpcontroller.text,context);
               
              },
              style: const ButtonStyle(
                  shadowColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 82, 18, 18),
                  ),
                  backgroundColor: MaterialStatePropertyAll(Colors.deepPurple)),
              child: const Text(
                'Get OTP',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'You will get OTP via sms',
            style: TextStyle(color: Color.fromARGB(255, 123, 122, 122)),
          )
        ],
      ),
    ));
  }
}



// PHONE NUM VERIFICATION



class Phoneveri extends StatelessWidget {
  String verifi;
  Phoneveri({super.key,required this.verifi});

  final pinputcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Verification',
                style: TextStyle(color: Colors.black),
              ),
              leading: const BackButton(color: Colors.black),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Column(children: [
              const SizedBox(height: 35),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Enter your\nVerification code',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 300,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
                  child: Pinput(
                    length: 6,
                    controller: pinputcontrol,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, right: 220),
                child: Text(
                  '04:59',
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                  'We send a verification code to your email.\nplease check your inbox'),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "I didn't recieve any code?send again",
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
              ElevatedButton(
                onPressed: () {
                  mobileAuth().verifyotp(pinputcontrol.text, context,verifi);
                },
                child: const Text('Sign up'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.only(
                        left: 130, right: 130, top: 15, bottom: 15)),
              ),
            ])));
  }
}

