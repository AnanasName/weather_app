import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'home_page.dart';

class WeatherDetailsPage extends StatefulWidget {
  const WeatherDetailsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WeatherDetailsPageState();
  }
}

class _WeatherDetailsPageState extends State<WeatherDetailsPage> {
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
