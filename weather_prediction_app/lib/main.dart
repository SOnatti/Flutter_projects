import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrentWeather {
  final int temperature;
  final String description;
  final String icon;

  CurrentWeather({
    required this.temperature,
    required this.description,
    required this.icon,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    final temp = json['main']['temp'];
    final desc = json['weather'][0]['description'];
    final icon = json['weather'][0]['icon'];
    return CurrentWeather(
      temperature: temp.round(),
      description: desc,
      icon: icon,
    );
  }
}

class DailyWeather {
  final String day;
  final String icon;
  final int maxTemp;
  final int minTemp;

  DailyWeather({
    required this.day,
    required this.icon,
    required this.maxTemp,
    required this.minTemp,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) {
    final ts = json['dt'];
    final day = DateTime.fromMillisecondsSinceEpoch(ts * 1000).weekday;
    final icon = json['weather'][0]['icon'];
    final max = json['temp']['max'];
    final min = json['temp']['min'];
    return DailyWeather(
      day: _getDay(day),
      icon: icon,
      maxTemp: max.round(),
      minTemp: min.round(),
    );
  }

  static String _getDay(int day) {
    switch (day) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      case DateTime.sunday:
        return 'Sunday';
      default:
        return '';
    }
  }
}

class WeatherData {
  final CurrentWeather currentWeather;
  final List<DailyWeather> dailyWeather;

  WeatherData({
    required this.currentWeather,
    required this.dailyWeather,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final current = CurrentWeather.fromJson(json);
    final List<dynamic> list = json['daily'];
    final daily = list.map((e) => DailyWeather.fromJson(e)).toList();
    return WeatherData(
      currentWeather: current,
      dailyWeather: daily,
    );
  }
}

Future<WeatherData> fetchWeatherData() async {
  final apiKey = '65dd9bc993cb170e920d0ecf494b5449';
  final lat = '37.7749';
  final lon = '-122.4194';
  final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return WeatherData.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load weather data');
  }
}

class WeatherDescription extends StatelessWidget {
  final CurrentWeather weather;

  WeatherDescription({required this.weather});

  @override
  Widget build(BuildContext context) {
    final temp = weather.temperature;
    final desc = weather.description;
    final icon = weather.icon;
    return Column(
      children: [
        Text(
          '$temp°',
          style: TextStyle(fontSize: 60, fontWeight:FontWeight.w300)),
          SizedBox(height: 10),
          Text(
          desc.toUpperCase(),
          style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: Colors.grey.shade500,
          ),
          ),
          SizedBox(height: 10),
          Image.network(
          'https://openweathermap.org/img/w/$icon.png',
          height: 100,
          width: 100,
          ),
          ],
          );
          }
          }

          class DailyWeatherCard extends StatelessWidget {
          final DailyWeather weather;

          DailyWeatherCard({required this.weather});

          @override
          Widget build(BuildContext context) {
          final day = weather.day;
          final maxTemp = weather.maxTemp;
          final minTemp = weather.minTemp;
          final icon = weather.icon;
          return Container(
          padding: EdgeInsets.all(10),
          child: Column(
          children: [
          Text(
          day,
          style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Image.network(
          'https://openweathermap.org/img/w/$icon.png',
          height: 50,
          width: 50,
          ),
          SizedBox(height: 10),
          Text(
          '$maxTemp° / $minTemp°',
          style: TextStyle(fontWeight: FontWeight.w500),
          ),
          ],
          ),
          );
          }
          }

          class WeatherPage extends StatefulWidget {
          @override
          _WeatherPageState createState() => _WeatherPageState();
          }

          class _WeatherPageState extends State<WeatherPage> {
          late Future<WeatherData> _weatherData;

          @override
          void initState() {
          super.initState();
          _weatherData = fetchWeatherData();
          }

          @override
          Widget build(BuildContext context) {
          return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
          'San Francisco',
          style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
          IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
          )
          ],
          elevation: 0,
          ),
          body: FutureBuilder<WeatherData>(
          future: _weatherData,
          builder: (context, snapshot) {
          if (snapshot.hasData) {
          final data = snapshot.data!;
          final current = data.currentWeather;
          final daily = data.dailyWeather;
          return ListView(
          children: [
          SizedBox(height: 20),
          WeatherDescription(weather: current),
          SizedBox(height: 30),
          Divider(color: Colors.grey.shade300),
          SizedBox(height: 20),
          Text(
          'Daily Forecasts',
          style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          SizedBox(
          height: 150,
          child: ListView.builder(
          itemCount: daily.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
          final item = daily[index];
          return DailyWeatherCard(weather: item);
          },
          ),
          ),
          SizedBox(height: 50),
          Text(
          'Activity Suggestion',
          style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
          'The weather is great today. You can take a walk in the park or have a picnic with your friends.',
          style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: Colors.grey.shade500,
          ),
          ),
          SizedBox(height: 20),
          ],
          );
          } else if (snapshot.hasError) {
          return Center(
          child: Text(
          'Failed to load weather data from open Weather ',
          style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                ;
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              // backgroundColor: Color.fromRGBO(69, 5, 243, 0),
              selectedItemColor: Color.fromARGB(255, 2, 40, 255),
              unselectedItemColor: Color.fromARGB(255, 8, 0, 0),
              currentIndex: 0,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
              onTap: (index) {},
            ),
          );
          }
          }

          void main() {
          runApp(MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          home: WeatherPage(),
          ));
          }
