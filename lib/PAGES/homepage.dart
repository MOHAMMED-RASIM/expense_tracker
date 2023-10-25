import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:figma/PAGES/expense.dart';
import 'package:figma/PAGES/function.dart';
import 'package:figma/PAGES/income.dart';
import 'package:figma/PAGES/otpcalling.dart';
import 'package:figma/PAGES/transfer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatelessWidget {
  homepage({super.key});

  // dropdown list

  var items = [
    'january',
    'februvary',
    'march',
    'april',
    'may',
    'june',
    'july',
    'august',
    'september',
    'october',
    'november',
    'december',
  ];

  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<Functions>(context);
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () async {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      await pref.clear();
                    },
                    icon: const Icon(
                      Icons.remove_circle_rounded,
                      color: Colors.deepPurple,
                    ))
              ],
              leading: 
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(image: AssetImage('assets/05.png')),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 80),
                child: DropdownButton(
                    value: provide.dropdownvalue,
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      provide.home(newValue);
                    }),
              ),
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      'ACCOUNT',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                      leading: IconButton(
                          onPressed: () {
                            signOut(context);
                          },
                          icon: const Icon(
                            Icons.logout,
                            color: Colors.deepPurple,
                          ))),
                ],
              ),
            ),
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Account Balance'),
                      ),
                      Text('\$${provide.mainbalance}',
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold)),

                      // income

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 15),
                            child: Container(
                                height: 100,
                                width: 160,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Stack(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 80, top: 25),
                                      child: Text(
                                        'Income',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 75, top: 45),
                                      child: Text(
                                        '\$${provide.displayincome}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 20),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Image.asset("assets/income.png"),
                                      ),
                                    )
                                  ],
                                )),
                          ),

                          // expense

                          Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 10),
                                child: Container(
                                  height: 100,
                                  width: 160,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Stack(
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(left: 80, top: 25),
                                        child: Text(
                                          'Expense',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 75, top: 45),
                                        child: Text(
                                          '\$${provide.displayexpense}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25, left: 20),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child:
                                              Image.asset("assets/expense.png"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 200, top: 20),
                        child: Text(
                          'Spend Frequency',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),

                      // line graph

                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: SizedBox(
                          width: 400,
                          height: 200,
                          child: LineChart(LineChartData(
                              minX: 0,
                              minY: 0,
                              maxX: 10,
                              maxY: 10,
                              titlesData: const FlTitlesData(show: false),
                              gridData: const FlGridData(
                                  show: false, drawVerticalLine: false),
                              borderData: FlBorderData(show: false),
                              lineBarsData: [
                                LineChartBarData(
                                  belowBarData: BarAreaData(
                                      show: true,
                                      gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromARGB(225, 183, 155, 230),
                                            Colors.white,
                                          ])),
                                  color: const Color(0xff713fc6),
                                  spots: [
                                    const FlSpot(0, 4),
                                    const FlSpot(1.5, 5),
                                    const FlSpot(2.5, 3),
                                    const FlSpot(3.5, 5.5),
                                    const FlSpot(4.9, 4),
                                    const FlSpot(6.8, 8.7),
                                    const FlSpot(8.8, 4),
                                    const FlSpot(13, 4)
                                  ],
                                  isCurved: true,
                                  dotData: const FlDotData(show: false),
                                  barWidth: 5,
                                )
                              ])),
                        ),
                      ),

                      const DefaultTabController(
                        length: 4,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: TabBar(tabs: [
                            Text('Today',
                                style: TextStyle(color: Colors.black)),
                            Text(
                              'Week',
                              style: TextStyle(color: Colors.black),
                            ),
                            Text('Month',
                                style: TextStyle(color: Colors.black)),
                            Text('Year', style: TextStyle(color: Colors.black)),
                          ]),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 180, top: 20),
                        child: Text(
                          'Recent Transaction',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Image.asset('assets/Card Transaction.png'),
                    ]),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              elevation: 0,
              notchMargin: 5,
              color: const Color.fromARGB(255, 255, 255, 255),
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/home.png',
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 80),
                    child: Image.asset(
                      'assets/transaction.png',
                      height: 40,
                    ),
                  ),
                  Image.asset(
                    'assets/pie-chart.png',
                    height: 40,
                  ),
                  Image.asset(
                    'assets/user.png',
                    height: 40,
                  )
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FabCircularMenuPlus(
                fabOpenIcon: Icon(Icons.add),
                ringColor: Colors.white.withAlpha(25),
                fabColor: Colors.deepPurple,
                alignment: Alignment.bottomCenter,
                ringDiameter: 200,
                ringWidth: 40,
                fabSize: 50,
                fabElevation: 8.0,
                fabIconBorder: const CircleBorder(),
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => income(),
                            ));
                      },
                      child: const Image(
                        image: AssetImage('assets/incomes.png'),
                        height: 45,
                      )),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => transfer(),
                          ));
                    },
                    child: const Image(
                      image: AssetImage('assets/transactions.png'),
                      height: 45,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => expense(),
                          ));
                    },
                    child: const Image(
                      image: AssetImage('assets/expenses.png'),
                      height: 45,
                    ),
                  ),
                ])),
      ),
    );
  }
}
