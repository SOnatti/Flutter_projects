// ignore_for_file: prefer_const_constructors, duplicate_ignore, unnecessary_string_interpolations

import 'package:flutter/material.dart';

Widget weatherLocation(String location, /*IconData icon,*/ String temperature , String date, String Status) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          // ignore: prefer_const_constructors
          SizedBox(
          height: 50.0,
        ),
         Text("$location", style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 26, 24, 24)),
        ),
          SizedBox(
          height: 10.0,
        ),
        /*Icon(icon,
        color: Color.fromARGB(192, 250, 248, 248), size: 80),
        SizedBox(
          height: 5.0,
        ),*/
        Text("$temperature", style: TextStyle(fontSize: 50,color: Color.fromARGB(255, 26, 27, 27)),
        ),
         SizedBox(
          height: 10.0,
        ),
        Text("$date", style: TextStyle(fontSize:10.0, color: Color.fromARGB(251, 255, 255, 255)),),
        Text("$Status", style: TextStyle(fontSize: 10.0,color: Color.fromARGB(251, 255, 255, 255)),)
      ],
    ),
  );
}
