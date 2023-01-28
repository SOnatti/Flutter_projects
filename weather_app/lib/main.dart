// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import "components/home.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //root
  //set keys
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
