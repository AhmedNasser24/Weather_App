import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/change_theme_color_cubit/change_theme_color_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  WeatherModel? weatherModel ;
  
getWeather({required String cityName}) async{
  try {
  emit(LoadingWeatherState()) ;
  weatherModel = await WeatherServices().getWeatherData(cityName: cityName) ;
  emit(SuccessWeatherState(weatherModel!)) ;
} catch (e) {
  log(e.toString()) ;
  emit(FailureWeatherState(errorMessage: e.toString().substring(11))) ;
}
  
}

  
  
}