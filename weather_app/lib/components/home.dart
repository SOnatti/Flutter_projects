// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers, unnecessary_new, duplicate_ignore

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/components/weather1.list.dart';
import 'widgets/hourly.text.widget.dart';
import 'widgets/location_current.widget.dart';
import 'widgets/updates.view.dart';
// curved bottom navigation package to create a curved bottom nav bar with animation

/// 1. define Home class (Extends StatefulWidget)
/// 2. create new State() --> _homeState()
/// 3. Define class _homeState (
/// items: card--weather forecast details, bottom nav)

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
      backgroundColor: Color.fromARGB(255, 184, 188, 224),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          weatherLocation(
              "Montreal", "22\u2103", "Saturday January 28, 2023",
               "Mostly Clear",),
          const SizedBox(height: 60),
          /*HourText("Hourly Updates", "Weekly Updates"),
          const SizedBox(
            height: 30,
          ),
          upDates("11:20am", Icons.sunny_snowing, "28.1"),*/
        ],
      ),

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 95, 100, 139),
        // ignore: prefer_const_literals_to_create_immutables
        items: <Widget>[
          Icon(Icons.location_pin),
          Icon(Icons.home),
          Icon(Icons.menu),
        ],
        animationDuration: const Duration(milliseconds: 150),
        color: Colors.white,
       
       //routing. navigating through the pages    //pagecontroller
        onTap: (int index) {
          var _index;
          // ignore: duplicate_ignore
          setState(() =>_index =index);if (_index==0) {
            // ignore: unnecessary_new
            var route = new MaterialPageRoute(builder: (BuildContext context) => new Home());
            Navigator.of(context).push(route);
            
          }
          else if(_index == 1){
            var route = new MaterialPageRoute(builder:(BuildContext context)=> new Weather1());
            Navigator.of(context).push(route);
          } else if (_index == 3){
            var route = new MaterialPageRoute(builder: (BuildContext context)=> new Home());
            Navigator.of(context).push(route);
          }}
          
          
          )
        ,
      
    );
  }
}
