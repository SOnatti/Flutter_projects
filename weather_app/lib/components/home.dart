
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
      // contains bottom navigation. 
      backgroundColor: const Color.fromARGB(255, 21, 2, 24),
      
      
      body:Column(
        
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          weatherLocation("Nairobi", Icons.wb_cloudy, "22", "Saturday January 28, 2023"),
          const SizedBox(height:60),
          HourText("Hour Updates", "Weekly Updates"),
          const SizedBox(height: 40,),
          upDates("11:20am", Icons.sunny_snowing, "28.1"),


        ],

      ),
        
      

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromARGB(255, 21, 2, 24),
        // ignore: prefer_const_literals_to_create_immutables
        items: [
        const Icon(Icons.location_pin), 
        const Icon(Icons.home), 
        const Icon(Icons.menu), 
        
      ],
      animationDuration: const Duration(milliseconds: 150),),
    );
  }
}
