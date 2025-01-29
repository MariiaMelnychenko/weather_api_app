import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/shared/models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({
    required this.weatherModel,
  }) : super(WeatherInitial()) {
    on<FetchWeatherByLocation>(_onFetchWeatherByLocation);
    on<FetchWeatherByCityName>(_onFetchWeatherByCityName);
  }
  final WeatherModel weatherModel;

  Future<void> _onFetchWeatherByLocation(
    FetchWeatherByLocation event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      final data = await weatherModel.getLocationWeather();
      emit(WeatherLoaded(data));
    } catch (e) {
      emit(WeatherError('Failed to fetch weather by location.'));
    }
  }

  Future<void> _onFetchWeatherByCityName(
    FetchWeatherByCityName event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    try {
      final data = await weatherModel.getCityWeather(event.cityName);
      emit(WeatherLoaded(data));
    } catch (e) {
      emit(
          WeatherError('Failed to fetch weather for city: ${event.cityName}.'));
    }
  }
}
