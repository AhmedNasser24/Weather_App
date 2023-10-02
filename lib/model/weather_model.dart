class WeatherModel {
  final num maxTemp;
  final num minTemp;
  final num avgTemp;
  final DateTime update;
  final String airCondition;
  final String imageOfAirCondition;
  final String cityName ;

  WeatherModel( {
    required this.cityName,
    required this.maxTemp,
    required this.minTemp,
    required this.avgTemp,
    required this.update,
    required this.airCondition,
    required this.imageOfAirCondition,
  });

  factory WeatherModel.fromJson(Map < String , dynamic > json) {

    WeatherModel weatherModel = WeatherModel(
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      avgTemp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      update: DateTime.parse(json["current"]["last_updated"]) ,
      airCondition: json["current"]["condition"]["text"],
      imageOfAirCondition: json["current"]["condition"]["icon"],
      cityName: json["location"]['name'],
    );

    

    return weatherModel;
  }
}
