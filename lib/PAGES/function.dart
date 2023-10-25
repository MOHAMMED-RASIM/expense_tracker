import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Functions extends ChangeNotifier {
  int displayincome = 0;
  int displayexpense = 0;
  int mainbalance = 0;

  Functions() {
    getvalue();
    notifyListeners();
  }

  getvalue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    displayincome = pref.getInt('income') ?? 0;
    displayexpense = pref.getInt('expense') ?? 0;
    mainbalance = pref.getInt('main') ?? 0;
    notifyListeners();
  }


  

  add(int n1) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('income', displayincome += n1);
    pref.setInt('main', mainbalance += n1);
    notifyListeners();
  }

  sub(int n2) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('expense', displayexpense += n2);
    pref.setInt('main', mainbalance -= n2);
    notifyListeners();
  }

  String dropdownvalue = 'january';
  void home(newValue) {
    dropdownvalue = newValue;
    notifyListeners();
  }

  String? idropdownvalue;
  void income1(newValue) {
    idropdownvalue = newValue;
    notifyListeners();
  }

  String? idropdownvaluee;
  void income2(newValue) {
    idropdownvaluee = newValue;
    notifyListeners();
  }

  bool switchvalue = true;
  void inc(value) {
    switchvalue = value;
    notifyListeners();
  }

  String? edropdownvalue;
  void expense1(newValue) {
    edropdownvalue = newValue;
    notifyListeners();
  }

  String? edropdownvaluee;
  void expense2(newValue) {
    edropdownvaluee = newValue;
    notifyListeners();
  }

  bool switchvaluee = true;
  void exp(value) {
    switchvaluee = value;
    notifyListeners();
  }

  bool ischecked = false;
  void tru(value) {
    ischecked = value;
    notifyListeners();
  }
}
