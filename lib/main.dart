import 'package:flutter/material.dart';
import 'package:weatherapp/pages/weather_details_page.dart';
import 'pages/home_page.dart';
import 'package:intl/intl.dart';

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
      MaterialPageRoute(builder: (context) => WeatherDetailsPage()),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  late String _backgroundImage = '';

  @override
  void initState() {
    super.initState();
    _setBackgroundImage();
  }

  void _setBackgroundImage() {
    var hourNow = int.parse(DateFormat('kk').format(DateTime.now()));
    if (hourNow >= 23 || hourNow < 4) {
      setState(() {
        print("yes");
        _backgroundImage = 'assets/images/1.jpg';
      });
    } else if (hourNow >= 4 && hourNow < 12) {
      setState(() {
        _backgroundImage = 'assets/images/2.jpg';
      });
    } else if (hourNow >= 12 && hourNow < 17) {
      setState(() {
        _backgroundImage = 'assets/images/3.jpg';
      });
    } else if (hourNow >= 17 && hourNow < 23) {
      setState(() {
        print("yes");
        _backgroundImage = 'assets/images/4.jpg';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WeatherApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(_backgroundImage),
          fit: BoxFit.cover,
        )),
        child: const HomePage(),
      ),
    );
  }
}
