import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherServices {
  final Dio dio = Dio();
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '688b43c7837d446fa64145344232409';

  Future<WeatherModel> getWeatherData({required String cityName}) async {
    try {
      var response =
          await dio.get("$baseUrl/forecast.json?key=$apiKey&q=$cityName");
      Map<String, dynamic> jsonData = response.data;
      return WeatherModel.fromJson(jsonData);
    } on DioException catch (e) {
       String errorMessage = e.response?.data['error']['message'] ??
          getDioException(e)[0];
      throw Exception(errorMessage);
    } catch (e) {
      const String errorMessage = 'oops , there was an error , try later !';
      throw Exception(errorMessage);
    }
  }
}

List<String> getDioException(DioException exception) {
  switch (exception.type) {
    case DioExceptionType.badResponse:
      return ['bad response error']; // your input is incorrect
    case DioExceptionType.connectionError:
      return ['connection Error , please Check your internet'];
    case DioExceptionType.connectionTimeout:
      return ['connection Timeout '];
    case DioExceptionType.sendTimeout:
      return ['sendTimeout'];
    case DioExceptionType.badCertificate:
      return ['badCertificate'];
    case DioExceptionType.receiveTimeout:
      return ['receiveTimeout'];
    case DioExceptionType.unknown:
      return ['unknown'];
    default:
      return ['no thing'];
  }
}