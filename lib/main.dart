import 'package:flutter/material.dart';
import 'package:weatherapp/pages/weather_details_page.dart';

void main() {
  runApp(WeatherForecast());
}

class WeatherForecast extends StatelessWidget {
  final List<String> days = [
    'Понедельник',
    'Вторник',
    'Среда',
    'Четверг',
    'Пятница',
    'Суббота',
    'Воскресенье'
  ];
  final List<String> temperatures = ['-1°C', '-3°C', '-5°C', '-4°C', '-2°C', '-2°C', '-3°C'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Forecast',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Forecast'),
        ),
        body: Container(
          height: WidgetsBinding
              .instance.platformDispatcher.views.first.physicalSize.height,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
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
