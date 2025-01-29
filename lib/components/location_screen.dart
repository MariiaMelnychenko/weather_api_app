import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/shared/bloc/bloc.dart';
import 'package:weather_app/shared/constants/constants.dart';
import 'package:weather_app/shared/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/shared/widgets/widgets.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({
    required this.locationWeather,
    super.key,
  });
  final dynamic locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late String cityName;
  late Map<String, dynamic> todayWeather;
  List<dynamic> forecast = [];

  @override
  void initState() {
    super.initState();
    if (widget.locationWeather != null) {
      _updateUI(widget.locationWeather);
    }
  }

  void _updateUI(dynamic weatherData) {
    setState(() {
      cityName = weatherData['location']['name'];
      List<Map<String, dynamic>> allDays =
          (weatherData['forecast']['forecastday'] as List)
              .map((day) => {
                    'date': DateTime.parse(day['date']),
                    'temperature': (day['day']['avgtemp_c'] as num).toDouble(),
                    'maxTemperature':
                        (day['day']['maxtemp_c'] as num).toDouble(),
                    'minTemperature':
                        (day['day']['mintemp_c'] as num).toDouble(),
                    'humidity': (day['day']['avghumidity'] as num).toDouble(),
                    'conditions': day['day']['condition']['text'],
                    'icon': day['day']['condition']['icon'],
                    'conditionCode': day['day']['condition']['code'],
                  })
              .toList();
      todayWeather = allDays.first;
      forecast = allDays.skip(1).take(9).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is WeatherLoaded) {
            _updateUI(state.weatherData);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: WeatherModel.getWeatherBackgroundGradient(
                  todayWeather['conditionCode']),
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          constraints: const BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: KPadding.kPaddingSize15,
                      vertical: KPadding.kPaddingSize15,
                    ),
                    child: TextField(
                      style: const TextStyle(color: AppColors.white),
                      cursorColor: AppColors.lightGrey,
                      decoration: InputDecoration(
                        hintText: 'Input City',
                        hintStyle: const TextStyle(
                          color: AppColors.lightGrey,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColors.lightGrey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: kBorderRadius,
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppColors.black18,
                      ),
                      onSubmitted: (value) {
                        if (value.trim().isNotEmpty) {
                          context
                              .read<WeatherBloc>()
                              .add(FetchWeatherByCityName(value));
                        }
                      },
                    )),
                KSizedBox.kHeightSizedBox20,
                Padding(
                  padding: const EdgeInsets.all(KPadding.kPaddingSize15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        cityName,
                        style: AppTextStyle.kText30,
                      ),
                      KSizedBox.kHeightSizedBox5,
                      Lottie.asset(
                        WeatherModel.getWeatherAnimation(
                            todayWeather['conditionCode']),
                        width: KPixel.kPixel200,
                        height: KPixel.kPixel200,
                      ),
                      Text(
                        '${todayWeather['temperature'].round()}°C',
                        style: AppTextStyle.kText30,
                      ),
                      KSizedBox.kHeightSizedBox5,
                      Text(
                        'Max: ${todayWeather['maxTemperature'].round()}°C | Min: ${todayWeather['minTemperature'].round()}°C, Humidity: ${todayWeather['humidity'].round()}%',
                        style: AppTextStyle.kText18,
                      ),
                    ],
                  ),
                ),
                KSizedBox.kHeightSizedBox20,
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: KPadding.kPaddingSize15),
                    itemCount: forecast.length,
                    itemBuilder: (context, index) {
                      var day = forecast[index];
                      return Padding(
                        padding: const EdgeInsets.all(KPadding.kPaddingSize5),
                        child: WeatherCardWidget(
                          day: day,
                          formattedDate:
                              DateFormat('EEEE, dd MMM').format(day['date']),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}
