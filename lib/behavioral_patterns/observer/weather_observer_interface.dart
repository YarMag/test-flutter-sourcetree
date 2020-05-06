
import 'package:flutter/foundation.dart';

enum DayTime {
  morning,
  day,
  evening,
  night
}

enum Weather {
  clearSky,
  rain,
  snow,
  storm
}

class WeatherModel {
  DayTime dayTime;
  Weather weather;

  WeatherModel({@required this.dayTime, @required this.weather});
}

abstract class IWeatherObserver {
  void onWeatherChanged(WeatherModel weather);
}