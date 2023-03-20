import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/intl_browser.dart';
import 'package:weatherly/components/cons.components.dart';


import '../widgets/weather.descrpt.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _cityController = TextEditingController();
  final constant_values _constants = constant_values();

  // api
  static String api = '5d85b6d249c83dd27336dc42c6f7804f';
  String weatherApi =
      "https://api.weatherapi.com/v1/forecast.json?key=" + api + "&days=7&q=";

  String location = 'London';
  String weatherIcons = 'cloudy.png';
  int temp = 0;
  int wind = 0;
  int humidity = 0;
  int cloud = 0;
  String date = '';

  List dailyforecasts = [];
  List hourforecasts = [];
  String currentweather = '';

  void fetchWeatherData(String searchText) async {
    try {
      var searchResult = await http.get(Uri.parse(weatherApi + searchText));

      final weatherData = Map<String, dynamic>.from(
          json.decode(searchResult.body) ?? 'No data');

      var locationData = weatherData["location"];

      var currentWeather = weatherData["current"];

      setState(() {
        location = getLocationName(locationData["name"]);

        var parsedDate =
            DateTime.parse(locationData["localtime"].substring(0, 10));
        var newDate = DateFormat('MMMMEEEEd').format(parsedDate);
        date = newDate;

        //updateWeather
        currentweather = currentWeather["condition"]["text"];
        weatherIcons =
            currentweather.replaceAll(' ', '').toLowerCase() + ".png";
        temp = currentWeather["temp_c"].toInt();
        wind = currentWeather["wind_kph"].toInt();
        humidity = currentWeather["humidity"].toInt();
        cloud = currentWeather["cloud"].toInt();

        //Forecast data
        dailyforecasts = weatherData["forecast"]["forecastday"];
        hourforecasts = dailyforecasts[0]["hour"];
      });
    } catch (e) {
      //debugPrint(e);
    }
  }

  static String getLocationName(String s) {
    List<String> wordList = s.split(" ");

    if (wordList.isNotEmpty) {
      if (wordList.length > 1) {
        return "${wordList[0]} ${wordList[1]}";
      } else {
        return wordList[0];
      }
    } else {
      return " ";
    }
  }

  @override
  void initState() {
    fetchWeatherData(location);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.only(top: 70, left: 10, right: 10),
        color: _constants.brand.withOpacity(.2),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: size.height * .7,
              decoration: BoxDecoration(
                color: _constants.sec_brand,
                boxShadow: [
                  BoxShadow(
                    color: _constants.brand.withOpacity(.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/menu.png",
                        width: 40,
                        height: 40,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/pin.png",
                            width: 20,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            location,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _cityController.clear();
                              showMaterialModalBottomSheet(
                                  context: context,
                                  builder: (context) => SingleChildScrollView(
                                        controller:
                                            ModalScrollController.of(context),
                                        child: Container(
                                          height: size.height * .2,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 10,
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: 70,
                                                child: Divider(
                                                  thickness: 3.5,
                                                  color: _constants.brand,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              TextField(
                                                onChanged: (searchText) {
                                                  fetchWeatherData(searchText);
                                                },
                                                controller: _cityController,
                                                autofocus: true,
                                                decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                      Icons.search,
                                                      color: _constants.brand,
                                                    ),
                                                    suffixIcon: GestureDetector(
                                                      onTap: () =>
                                                          _cityController
                                                              .clear(),
                                                      child: Icon(
                                                        Icons.close,
                                                        color: _constants.brand,
                                                      ),
                                                    ),
                                                    hintText:
                                                        'Search city e.g. London',
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: _constants.brand,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "",
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 160,
                    child: Image.asset("assets/" + weatherIcons),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          temp.toString(),
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'o',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    currentweather,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Divider(
                      color: Colors.white70,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WeatherItem(
                          value: wind.toInt(),
                          unit: 'km/h',
                          imageUrl: 'assets/wind.png',
                        ),
                        WeatherItem(
                          value: humidity.toInt(),
                          unit: '%',
                          imageUrl: 'assets/cloudy(2).png',
                        ),
                        WeatherItem(
                          value: cloud.toInt(),
                          unit: '%',
                          imageUrl: 'assets/cloudy.png',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              height: size.height * .20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Today',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => weatherDescript(
                                      dailyForecast: dailyforecasts,
                                    ))), //this will open forecast screen
                        child: Text(
                          'Forecasts',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: _constants.brand,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 110,
                    child: ListView.builder(
                      itemCount: hourforecasts.length,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        String currentTime =
                            DateFormat('HH:mm:ss').format(DateTime.now());
                        String currentHour = currentTime.substring(0, 2);

                        String forecastTime =
                            hourforecasts[index]["time"].substring(11, 16);
                        String forecastHour =
                            hourforecasts[index]["time"].substring(11, 13);

                        String forecastWeatherName =
                            hourforecasts[index]["condition"]["text"];
                        String forecastWeatherIcon = forecastWeatherName
                                .replaceAll(' ', '')
                                .toLowerCase() +
                            ".png";

                        String forecastTemperature =
                            hourforecasts[index]["temp_c"].round().toString();
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          margin: const EdgeInsets.only(right: 20),
                          width: 65,
                          decoration: BoxDecoration(
                              color: currentHour == forecastHour
                                  ? Colors.white
                                  : _constants.brand,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 1),
                                  blurRadius: 5,
                                  color: _constants.brand.withOpacity(.2),
                                ),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                forecastTime,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Image.asset(
                                'assets/' + forecastWeatherIcon,
                                width: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    forecastTemperature,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'o',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      fontFeatures: const [
                                        FontFeature.enable('sups'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showMaterialModalBottomSheet(
      {required BuildContext context,
      required SingleChildScrollView Function(dynamic context) builder}) {

      }
}

class WeatherItem extends StatelessWidget {
  final int value;
  final String unit;
  final String imageUrl;
  const WeatherItem(
      {Key? key,
      required this.value,
      required this.unit,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(imageUrl),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          value.toString() + unit,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class ModalScrollController {
  static of(context) {}
}
