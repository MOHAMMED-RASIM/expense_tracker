import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class transfer extends StatelessWidget {
  transfer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 110, 255),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 110, 255),
        title: const Text(
          'Transfer',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 264,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'How much?',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 105, 244, 172),
                ),
              ),
            ),
            Container(
              height: 60,
              child: const TextField(
                // maxLines: 10,
                showCursor: false,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white, fontSize: 55),
                decoration: InputDecoration(
                    hintText: '0',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.attach_money_rounded,
                      size: 65,
                    ),
                    prefixIconConstraints:
                        BoxConstraints(maxWidth: 50, maxHeight: 55),
                    prefixIconColor: Colors.white,
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            const SizedBox(
              height: 34,
            ),
            Container(
              height: 390,
              width: 450,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 340,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 140,
                          child: TextField(
                            style: const TextStyle(
                                color: Color.fromARGB(255, 96, 96, 96)),
                            decoration: InputDecoration(
                                hintText: 'From',
                                hintStyle: const TextStyle(
                                    color: Color.fromARGB(255, 96, 96, 96)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        const Image(image: AssetImage('assets/transfer.png')),
                        SizedBox(
                          width: 140,
                          child: TextField(
                            style: const TextStyle(
                                color: Color.fromARGB(255, 96, 96, 96)),
                            decoration: InputDecoration(
                                hintText: 'To',
                                hintStyle: const TextStyle(
                                    color: Color.fromARGB(255, 96, 96, 96)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: 340,
                      height: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(width: 2, color: Colors.grey)),
                      child: const TextField(
                        showCursor: false,
                        style:
                            TextStyle(color: Color.fromARGB(255, 96, 96, 96)),
                        decoration: InputDecoration(
                            hintText: 'Description',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 96, 96, 96)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 340,
                    child: DottedBorder(
                      color: const Color.fromARGB(255, 201, 200, 200),
                      dashPattern: [10, 10],
                      radius: const Radius.circular(30),
                      child: Container(
                        height: 40,
                        width: 340,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.attach_file_sharp),
                            Text('   Add Attachment')
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    child: const Text('continue'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.only(
                            left: 130, right: 130, top: 15, bottom: 15)),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
