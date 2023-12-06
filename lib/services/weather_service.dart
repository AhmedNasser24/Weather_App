
import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherServices {
  final Dio dio = Dio();
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '8319d3361b5148ed97d110516230212';

  Future <List <WeatherModel>> getWeatherData({required String cityName , required int numberOfDays}) async {
    try {
      var response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=$numberOfDays");
      Map<String, dynamic> jsonData = response.data;
      List < WeatherModel > weatherModelList = [];
      for (int i = 0; i < numberOfDays; i++) {
        weatherModelList.add(WeatherModel.fromJson(jsonData , i ,numberOfDays )) ;
      }
      return weatherModelList ;
    } on DioException catch (e) {
      String errorMessage =
          e.response?.data['error']['message'] ?? getDioException(e)[0];
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
