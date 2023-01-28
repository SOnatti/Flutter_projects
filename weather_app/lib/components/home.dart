import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override 
  State<Home> createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 21, 2, 24),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 21, 2, 24),
        items: [
        Icon(Icons.location_pin), 
        Icon(Icons.home), 
        Icon(Icons.menu), 
        
      ],
      animationDuration: Duration(milliseconds: 150),),
    );
  }
}
