import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/widget/big_text.dart';
import 'package:weather_app/widget/cached_network_image.dart';
import 'package:weather_app/widget/medium_text.dart';
import 'package:weather_app/widget/small_text.dart';
import 'package:weather_app/widget/text_field.dart';
import 'package:weather_app/widget/vertical_distance.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key, required this.weatherModel});
  final WeatherModel weatherModel ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BigText(
            text: weatherModel.cityName,
          ),
          MediumText(
            text: 'update at: ${weatherModel.update.hour}:${weatherModel.update.minute}',
          ),
          const VerticalDistance(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CachedImage(imageUrl: weatherModel.imageOfAirCondition),
              BigText(text: "${weatherModel.avgTemp.round()}"),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SmallText(
                    text: 'Max Temp: ${weatherModel.maxTemp.round()}',
                  ),
                  SmallText(
                    text: "Min Temp: ${weatherModel.minTemp.round()}",
                  ),
                ],
              )
            ],
          ),
          const VerticalDistance(5),
          BigText(text: weatherModel.airCondition),
        ],
      ),
    );
  }
}

