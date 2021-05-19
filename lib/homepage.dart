import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/Styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var temperature;
  var feelslike;
  var visibility;
  var place = "Hyderabad";
  var currently;
  var humidity;
  var windspeed;
  // var icon;

  Future getweather() async {
    http.Response response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$place&appid=798d0436d5df1dc5186c46e2f799d782"),
    );
    var values = jsonDecode(response.body);
    setState(
      () {
        this.temperature = values['main']['temp'];
        this.feelslike = values['main']['feels_like'];
        this.currently = values['weather'][0]['main'];
        this.humidity = values['main']['humidity'];
        this.visibility = values['visibility'];
        this.windspeed = values['wind']['speed'];
        // this.icon = values['weather'][0]['icon'];
      },
    );
  }

  @override
  void initState() {
    super.initState();
    this.getweather();
  }

  @override
  Widget build(BuildContext context) {
    feelslike = feelslike - 273;
    temperature = temperature - 273;
    visibility = visibility / 1000;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.5,
            color: backGround,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(97, 190, 91, 0),
              child: Column(
                children: <Widget>[
                  // FaIcon(Icons.cloud),
                  Text(
                    temperature != null
                        ? temperature.toStringAsFixed(1) + "\u00B0"
                        : "loading",
                    style: ThemeText.Degree,
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    currently != null ? currently.toString() : "loading",
                    style: ThemeText.weather_condition,
                  ),
                  Text(
                    place != null ? place.toString() : "loading",
                    style: ThemeText.Place,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: FaIcon(
                      Icons.thermostat_rounded,
                      color: Colors.blue,
                    ),
                    title: Text("FeelsLike", style: ThemeText.info),
                    trailing: Text(
                      feelslike != null
                          ? feelslike.toStringAsFixed(1) + "\u00B0"
                          : "loading",
                      style: ThemeText.values,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.visibility_rounded,
                      color: Colors.blue,
                    ),
                    title: Text("visibility", style: ThemeText.info),
                    trailing: Text(
                      visibility != null
                          ? visibility.toString() + "km"
                          : "loading",
                      style: ThemeText.values,
                    ),
                  ),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.sun,
                      color: Colors.blue,
                    ),
                    title: Text("humidity", style: ThemeText.info),
                    trailing: Text(
                      humidity != null ? humidity.toString() + "%" : "loading",
                      style: ThemeText.values,
                    ),
                  ),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.wind,
                      color: Colors.blue,
                    ),
                    title: Text("WindSpeed", style: ThemeText.info),
                    trailing: Text(
                      windspeed != null
                          ? windspeed.toString() + "m/Sec"
                          : "loading",
                      style: ThemeText.values,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
