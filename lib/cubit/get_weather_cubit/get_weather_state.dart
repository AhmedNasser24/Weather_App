import 'package:weather_app/model/weather_model.dart';

abstract class WeatherState {}

class NoWeatherState extends WeatherState {}
class LoadingWeatherState extends WeatherState {}
class SuccessWeatherState extends WeatherState {
  SuccessWeatherState(this.weatherModel) ;
  final WeatherModel weatherModel ;
  
}
class FailureWeatherState extends WeatherState {
  final String errorMessage ;
  FailureWeatherState({required this.errorMessage}) ;
}