import 'package:flutter/material.dart';

import 'home_page.dart';

class WeatherDetailsPage extends StatefulWidget {
  const WeatherDetailsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WeatherDetailsPageState();

  }
}

class _WeatherDetailsPageState extends State<WeatherDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'WeatherApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
