// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Weather1()
));


class Weather1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 184, 188, 224),

      appBar: AppBar(
        title: Text('<                           Weather'),
        centerTitle: false,
              ),
      body: Container(
        color: Color.fromARGB(255, 184, 188, 224),

        margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom:20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container( ///THE SEARCHBAR
              padding:EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              ///Giving a border for the container
              decoration: BoxDecoration(
                color: Color(0xFF1d2252),///BACKGROUND COLOR FOR THE SEARCHBAR
                border: Border.all(width: 3, color: Color(0xFF1d2225)),
                borderRadius: BorderRadius.all(Radius.circular(40)), //Giving the searchbar a circular shape
              ), ///Styling the searchbar's

              child: Text('SearchBar', style: TextStyle(fontSize: 18, color: Colors.white)),
            ), ///THE SEARCHBAR
            Container(
              color:Color(0xFF34469f),
              margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom:1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Text('30\u2103', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
                      Text('H24 L:18', style: TextStyle(fontSize: 18)),
                      Text('Kicukiro, Rwanda',style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding:EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                        child: Icon(Icons.sunny, color: Colors.green[500], size: 90,),
                      )
                    ],
                  ),
                ],
              ),
            ), ///A container that holds a row for a certain weather
            Container(
              color:Color(0xF334469f),
              margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom:1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const[
                      Text('23\u2103', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
                      Text('H24 L:16', style: TextStyle(fontSize: 18)),
                      Text('Kayonza, Rwanda',style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding:EdgeInsets.symmetric(vertical: 40, horizontal: 60),
                        child: Icon(Icons.cloud, color: Colors.green[500], size: 90,),
                      )
                    ],
                  ),
                ],
              ),
            ), ///A container that holds a row for a certain weather
            Container(
              color:Color(0xF334469f),
              margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom:0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Text('30\u2103', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
                      Text('H30 L:23', style: TextStyle(fontSize: 18)),
                      Text('Kicukiro, Rwanda',style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding:EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                        child: Icon(Icons.cloudy_snowing, color: Colors.green[500], size: 90,),
                      )
                    ],
                  ),
                ],
              ),
            ), ///A container that holds a row for a certain weather
          ],
        ),
      ),
      
    );
  }
}