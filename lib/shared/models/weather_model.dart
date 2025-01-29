import 'dart:ui';
import 'package:weather_app/shared/constants/constants.dart';
import 'package:weather_app/shared/services/location.dart';
import 'package:weather_app/shared/services/networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String apiKey = dotenv.env['API_KEY'] ?? 'default_value';
const apiBaseUrl = 'http://api.weatherapi.com/v1';
const days = 9;

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    final endpoint =
        '$apiBaseUrl/forecast.json?key=$apiKey&q=$cityName&days=$days&aqi=no&alerts=no';
    NetworkHelper networkHelper = NetworkHelper(endpoint);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location myLocation = Location();
    await myLocation.getCurrentLocation();
    final endpoint =
        '$apiBaseUrl/forecast.json?key=$apiKey&q=${myLocation.latitude},${myLocation.longitude}&days=$days&aqi=no&alerts=no';
    NetworkHelper networkHelper = NetworkHelper(endpoint);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  static String getWeatherAnimation(int conditionCode) {
    if (conditionCode == 1000) {
      return 'assets/sunny.json';
    } else if (conditionCode == 1003 ||
        conditionCode == 1006 ||
        conditionCode == 1009) {
      return 'assets/cloud.json';
    } else if (conditionCode >= 1030 && conditionCode <= 1135) {
      return 'assets/fog.json';
    } else if (conditionCode >= 1063 && conditionCode <= 1195) {
      return 'assets/rain.json';
    } else if (conditionCode >= 1198 && conditionCode <= 1246) {
      return 'assets/rain.json';
    } else if (conditionCode >= 1249 && conditionCode <= 1264) {
      return 'assets/snow.json';
    } else if (conditionCode >= 1273 && conditionCode <= 1282) {
      return 'assets/thunder.json';
    } else {
      return 'assets/sunny.json';
    }
  }

  static List<Color> getWeatherBackgroundGradient(int conditionCode) {
    if (conditionCode == 1000) {
      // clear
      return [
        AppColors.clearSkyLight,
        AppColors.clearSkyDark,
      ];
    } else if (conditionCode == 1003) {
      // partly cloudy
      return [
        AppColors.partlyCloudyLight,
        AppColors.partlyCloudyDark,
      ];
    } else if (conditionCode == 1006 || conditionCode == 1009) {
      // cloudy
      return [
        AppColors.cloudyLight,
        AppColors.cloudyDark,
      ];
    } else if (conditionCode >= 1030 && conditionCode <= 1135) {
      // fog
      return [
        AppColors.fogLight,
        AppColors.fogDark,
      ];
    } else if (conditionCode >= 1063 && conditionCode <= 1195) {
      // rain
      return [
        AppColors.rainLight,
        AppColors.rainDark,
      ];
    } else if (conditionCode >= 1198 && conditionCode <= 1246) {
      // heavy rain
      return [
        AppColors.heavyRainLight,
        AppColors.heavyRainDark,
      ];
    } else if (conditionCode >= 1249 && conditionCode <= 1264) {
      // snow
      return [
        AppColors.snowLight,
        AppColors.snowDark,
      ];
    } else if (conditionCode >= 1273 && conditionCode <= 1282) {
      // thunderstorm
      return [
        AppColors.thunderstormLight,
        AppColors.thunderstormDark,
      ];
    } else {
      return [
        AppColors.clearSkyLight,
        AppColors.clearSkyDark,
      ];
    }
  }
}
