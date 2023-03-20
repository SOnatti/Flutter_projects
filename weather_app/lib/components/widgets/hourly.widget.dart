import 'package:flutter/material.dart';

Widget HourText(String text, String textIi) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
      child: Column(
        children:[
                  Text(text ,style: TextStyle(fontSize: 15.0, color: Colors.white,  ),),      

        ]
      ),
      ),

      Padding(padding: EdgeInsets.fromLTRB(26, 0, 26, 0),
      child: Column(
        children:[
                  Text("$textIi" ,style: TextStyle(fontSize: 13.0, color: Color.fromARGB(255, 88, 80, 80),  ),),      

        ]
      ),
      ),
      
    ],
    
      


      
    
  );
}