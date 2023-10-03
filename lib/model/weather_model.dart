class WeatherModel {
  final num maxTemp;
  final num minTemp;
  final num avgTemp;
  final DateTime update;
  final String airCondition;
  final String imageOfAirCondition;
  final String cityName ;
  final int totalDays ;
  WeatherModel( {
    required this.totalDays,
    required this.cityName,
    required this.maxTemp,
    required this.minTemp,
    required this.avgTemp,
    required this.update,
    required this.airCondition,
    required this.imageOfAirCondition,
  });

  factory WeatherModel.fromJson(Map < String , dynamic > json , int dayIndx , int numberOfDays ) {

    WeatherModel weatherModel = WeatherModel(
      totalDays: numberOfDays,
      maxTemp: json["forecast"]["forecastday"][dayIndx]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][dayIndx]["day"]["mintemp_c"],
      avgTemp: json["forecast"]["forecastday"][dayIndx]["day"]["avgtemp_c"],
      update: DateTime.parse(json["current"]["last_updated"]) ,
      airCondition: json["forecast"]["forecastday"][dayIndx]["day"]["condition"]["text"],
      imageOfAirCondition: json["forecast"]["forecastday"][dayIndx]["day"]["condition"]["icon"],
      cityName: json["location"]['name'],
    );

    

    return weatherModel;
  }
}
