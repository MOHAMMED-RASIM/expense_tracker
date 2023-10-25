import 'package:figma/PAGES/function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class expense extends StatelessWidget {
  expense({super.key});

  String edropdownvalue = 'Category';

  List<String> drop = ['Category', 'Salary'];

  String edropdownvaluee = 'Wallet';

  List<String> dropp = ['Wallet', 'Gpay'];

  final numb = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<Functions>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Padding(
            padding: EdgeInsets.only(left: 90),
            child: Text('Expense'),
          ),
          backgroundColor: Colors.red,
        ),
        backgroundColor: Colors.red,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 115,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'How much?',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(230, 227, 214, 214)),
                  ),
                ],
              ),
              TextField(
                controller: numb,
                cursorColor: Colors.white,
                cursorHeight: 30,
                showCursor: true,
                style: const TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.attach_money,
                      color: Colors.white,
                      size: 40,
                    ),
                    hintText: '0',
                    hintStyle: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                height: 550,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      width: 370,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 214, 202, 202),
                                        width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 214, 202, 202),
                                        width: 2))),
                            value: edropdownvalue,
                            hint: Text(edropdownvalue),
                            onChanged: (String? newValue) {
                              provide.expense1(newValue);
                            },
                            items: drop.map((String drop) {
                              return DropdownMenuItem(
                                value: drop,
                                child: Text(drop),
                              );
                            }).toList()),
                      ),
                    ),
                    const SizedBox(
                      width: 370,
                      child: Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'Description',
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black87))),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 370,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 214, 202, 202),
                                        width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 214, 202, 202),
                                        width: 2))),
                            value: edropdownvaluee,
                            hint: Text(edropdownvaluee),
                            onChanged: (String? newValue) {
                              provide.expense2(newValue);
                            },
                            items: dropp.map((String dropp) {
                              return DropdownMenuItem(
                                value: dropp,
                                child: Text(dropp),
                              );
                            }).toList()),
                      ),
                    ),
                    Container(
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 80,
                          ),
                          Icon(Icons.attach_file),
                          Text('Add attachment'),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 40, bottom: 20),
                              child: Text(
                                'Repeat',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 30,
                              ),
                              child: CupertinoSwitch(
                                  value: provide.switchvaluee,
                                  onChanged: (value) {
                                    provide.exp(value);
                                  }),
                            )
                          ]),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        right: 200,
                      ),
                      child: Text('Repeat transaction'),
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      child: const Text('continue'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple,
                          padding: EdgeInsets.only(
                              left: 130, right: 130, top: 15, bottom: 15)),
                      onPressed: () {
                        int parsexpense = int.parse(numb.text);
                        provide.sub(parsexpense);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
