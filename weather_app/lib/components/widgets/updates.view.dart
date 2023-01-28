// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, duplicate_ignore

import 'package:flutter/material.dart';

//final date = DateTime.now();

Widget upDates(String time, IconData icon, String temperature) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(padding:EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Column(

          children: [
                 Text("$time", style: TextStyle(fontSize: 10,color: Color.fromARGB(255, 218, 205, 187)),
        ),
          SizedBox(
          height: 10.0,
        ),
        Icon(icon,
        color: Color.fromARGB(192, 245, 248, 246), size: 80),
        SizedBox(
          height: 5.0,
        ),
        Text("$temperature", style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 250, 251, 252)),
        ),
         SizedBox(
          height: 5.0,
        ),
          ],
        ),
        
        
        ),
        
        Padding(padding:
        EdgeInsets.fromLTRB(12, 0, 12, 0),
        // ignore: duplicate_ignore
        child:Column(
          // ignore: prefer_const_constructors
          children: [Text("$time", style: TextStyle(fontSize: 10,color: Color.fromARGB(255, 218, 205, 187)),
         ),
          SizedBox(
          height: 10.0,
          ),
          Icon(icon,
          color: Color.fromARGB(192, 245, 248, 246), size: 80),
          SizedBox(
            height: 5.0,
          ),
          Text("$temperature", style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 250, 251, 252)),
          ),
          SizedBox(
            height: 5.0,
          ),
          ],
        ),
       ),

       Padding(padding:
        EdgeInsets.fromLTRB(12, 0, 12, 0),
        child:Column(
          // ignore: prefer_const_constructors
          children: [Text("$time", style: TextStyle(fontSize: 10,color: Color.fromARGB(255, 218, 205, 187)),
         ),
          SizedBox(
          height: 10.0,
          ),
          Icon(icon,
          color: Color.fromARGB(192, 245, 248, 246), size: 80),
          SizedBox(
            height: 5.0,
          ),
          Text("$temperature", style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 250, 251, 252)),
          ),
          SizedBox(
            height: 5.0,
          ),
          ],
        ),
       ),
        
       
      
      ],
    

    ),
  );
}
