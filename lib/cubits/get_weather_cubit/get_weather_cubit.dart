import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  List <WeatherModel> weatherModel = [] ;
  
getWeather({required String cityName , required int numberOfDays}) async{
  try {
  emit(LoadingWeatherState()) ;
  weatherModel = await WeatherServices().getWeatherData(cityName: cityName , numberOfDays: numberOfDays) ;
  emit(SuccessWeatherState(weatherModel)) ;
} catch (e) {
  log(e.toString()) ;
  emit(FailureWeatherState(errorMessage: e.toString().substring(11))) ;
}
  
}

  
  
}