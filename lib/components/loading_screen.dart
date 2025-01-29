import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/shared/shared.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WeatherBloc>().add(FetchWeatherByLocation());
    return Scaffold(
      body: BlocListener<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is WeatherLoaded) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    LocationScreen(locationWeather: state.weatherData),
              ),
            );
          } else if (state is WeatherError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.blue,
                AppColors.lightBlue,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Weather App',
                style: AppTextStyle.kText40,
                textAlign: TextAlign.center,
              ),
              KSizedBox.kHeightSizedBox20,
              SpinKitFadingCircle(
                color: AppColors.white,
                size: KPixel.kPixel50,
              ),
              KSizedBox.kHeightSizedBox40,
              LogoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
