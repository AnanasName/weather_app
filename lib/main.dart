import 'package:flutter/material.dart';
import 'package:weatherapp/pages/weather_details_page.dart';

void main() {
  runApp(WeatherForecast());
}

class WeatherForecast extends StatelessWidget {
  final List<String> days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday'
  ];
  final List<String> temperatures = ['25°C', '28°C', '30°C', '26°C', '24°C'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Forecast'),
        ),
        body: Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: days.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => _onCardPressed(context, index),
                child: Container(
                  width: 150,
                  margin: EdgeInsets.all(10),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          days[index],
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 10),
                        Text(
                          temperatures[index],
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onCardPressed(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WeatherDetailsPage()),
    );
  }
}
