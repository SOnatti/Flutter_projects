import 'package:flutter/material.dart';

Widget weatherLocation(String location, IconData icon, String temperature , String date) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          // ignore: prefer_const_constructors
          SizedBox(
          height: 50.0,
        ),
         Text("$location", style: TextStyle(fontSize: 10,color: Color.fromARGB(255, 255, 255, 255)),
        ),
          SizedBox(
          height: 10.0,
        ),
        Icon(icon,
        color: Color.fromARGB(192, 250, 248, 248), size: 80),
        SizedBox(
          height: 5.0,
        ),
        Text("$temperature", style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 250, 251, 252)),
        ),
         SizedBox(
          height: 10.0,
        ),
        Text("$date", style: TextStyle(fontSize:10.0, color: Color.fromARGB(251, 255, 255, 255)),)
      ],
    ),
  );
}