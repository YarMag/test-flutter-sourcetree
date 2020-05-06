import 'package:start_app/behavioral_patterns/observer/weather_observer_interface.dart';
import 'package:start_app/behavioral_patterns/observer/weather_service_interface.dart';

class GlobalWorld {
  IWeatherService _weatherService;

  GlobalWorld({IWeatherService weatherService})
      : this._weatherService = weatherService;

  void setWeatherObservers(List<IWeatherObserver> observers) {
    observers.forEach((o) => _weatherService.add(o));
  }
}
