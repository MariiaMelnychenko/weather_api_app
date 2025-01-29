part of 'weather_bloc.dart';

abstract class WeatherEvent {}

class FetchWeatherByLocation extends WeatherEvent {}

class FetchWeatherByCityName extends WeatherEvent {
  final String cityName;
  FetchWeatherByCityName(this.cityName);
}
