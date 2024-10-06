import 'package:flutter/material.dart';
import 'package:webdemo/screens/home.dart';
import 'package:webdemo/screens/paymentplan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}
