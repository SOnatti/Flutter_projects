import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/components/weather1.dart';
import 'widgets/hourly.widget.dart';
import 'widgets/location_current.dart';
import 'widgets/updates.view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override 
  @override
  State<Home> createState() => _homeState();
}

class _homeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // contains bottom navigation. 
      backgroundColor: Color(0xFF28317e),

      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // weatherLocation("Nairobi", Icons.wb_cloudy, "22", "Saturday January 28, 2023"),
          // const SizedBox(height:60),
          weatherLocation(
              "Kigali", Icons.wb_cloudy, "22", "Saturday January 28, 2023"),
          const SizedBox(height: 60),
          HourText("Hour Updates", "Weekly Updates"),
          // const SizedBox(height: 40,),
          const SizedBox(
            height: 40,
          ),
          upDates("11:20am", Icons.sunny_snowing, "28.1"),


        ],

      ),
        
      

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromARGB(255, 21, 2, 24),
        // ignore: prefer_const_literals_to_create_immutables
        
        items: <Widget>[
          Icon(Icons.location_pin),
          Icon(Icons.home),
          Icon(Icons.menu),
        ],
        animationDuration: const Duration(milliseconds: 150),
        color: Colors.white,
       //routing.       
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