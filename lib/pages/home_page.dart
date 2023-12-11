import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../models/weather_model.dart';
import '../services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// api key
  final _weatherService = WeatherService("c341e34f9b7c327502cde34aa7817c5f");
  Weather? _weather;

// Получаем прогноз погоды

  _fetchWeather() async {
// получаем текущий город
    String cityName = await _weatherService.getCurrentCity();
// получить погоду для этого города
    try {
      bool flag = true;
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }

// если есть ошибки, то:
    catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
// получение погоды при запуске
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    if (_weather != null) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(_weather?.cityName ?? "Город",
                  style: const TextStyle(
                      fontFamily: '.SF UI Text',
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Lottie.asset("assets/${_weather?.icon ?? "01d"}.json",
                      height: 225, width: 225),
                  Text(
                    '${_weather?.temperature.round()}°C',
                    style: const TextStyle(
                        fontFamily: '.SF UI Text',
                        fontSize: 50,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ),
              Text(_weather?.description ?? "Описание",
                  style: const TextStyle(
                      fontFamily: '.SF UI Text',
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: Colors.black87)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/gauge.png', height: 50, width: 50),
                  Text('${_weather?.pressure.round().toString()} мм.рт.с.' ??
                      "Давление"),
                  Image.asset('assets/wind.png', height: 50, width: 50),
                  Text('${_weather?.speed} м/с' ?? "Скорость ветра"),
                  Image.asset('assets/humidity.png', height: 50, width: 50),
                  Text('${_weather?.humidity}%' ?? "Влажность"),
                ],
              ),
            ]),
          ),
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}

// Класс "HomePage" является изменяемым виджетом состояния и наследуется от класса
//  "StatefulWidget". В конструкторе класса указывается ключ 'key' и используется 
//  вызов конструктора суперкласса.

// Класс "_HomePageState" является состоянием виджета "HomePage" и наследуется от 
// класса "State". В этом классе определены методы и переменные для получения и 
// отображения данных о погоде.

// Метод "_fetchWeather" асинхронно получает текущий город и погодные данные с 
// использованием экземпляра класса "WeatherService". После получения данных, 
// метод обновляет состояние виджета с помощью метода "setState". Если возникают 
// ошибки, исключение обрабатывается и выводится сообщение об ошибке.

// Метод "initState" вызывается при инициализации виджета и выполняет получение 
// данных о погоде с помощью метода "_fetchWeather".

// Метод "build" строит виджет на основе полученных данных о погоде. Если данные 
// присутствуют, создается экземпляр "Scaffold" с разметкой для отображения погоды.
//  В противном случае отображается индикатор загрузки. Виджет включает в себя текст
//   с названием города и описанием погоды, а также изображения и текст с данными 
//   о давлении, скорости ветра и влажности.

// Таким образом, этот код реализует виджет "HomePage", который получает и 
// отображает данные о погоде.