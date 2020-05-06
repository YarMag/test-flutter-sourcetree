
import 'package:start_app/behavioral_patterns/observer/weather_observer_interface.dart';

abstract class IWeatherService {
  void add(IWeatherObserver observer);
  void remove(IWeatherObserver observer);
  void simulateNewWeather();
}
