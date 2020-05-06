import 'dart:math';

import 'package:start_app/behavioral_patterns/observer/weather_observer_interface.dart';
import 'package:start_app/behavioral_patterns/observer/weather_service_interface.dart';

class WeatherService implements IWeatherService {
  List<IWeatherObserver> _observers = [];
  WeatherModel _currentWeather;
  Random _random = Random();

  WeatherService(this._observers);

  void add(IWeatherObserver observer) {
    if (!_observers.contains(observer)) {
      _observers.add(observer);
    }
  }

  void remove(IWeatherObserver observer) {
    if (_observers.contains(observer)) {
      _observers.remove(observer);
    }
  }

  void simulateNewWeather() {
    _currentWeather =
        WeatherModel(dayTime: _getNextDayTime(), weather: _getNextWeather());

    _observers.forEach((o) => o.onWeatherChanged(_currentWeather));
  }

  Weather _getNextWeather() {
    return Weather.values[_random.nextInt(Weather.values.length)];
  }

  DayTime _getNextDayTime() {
    return DayTime.values[
        (_random.nextInt(DayTime.values.length) + 1) % DayTime.values.length];
  }
}
