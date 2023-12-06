import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/change_day/change_day.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/widget/big_text.dart';
import 'package:weather_app/widget/cached_network_image.dart';
import 'package:weather_app/widget/medium_text.dart';
import 'package:weather_app/widget/small_text.dart';
import 'package:weather_app/widget/vertical_distance.dart';

import '../functions/material_color.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key, required this.weatherModel});
  final List<WeatherModel> weatherModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeDayCubit, int>(
      builder: (context, dayIndex) {
        MaterialColor materialColor = getMaterialColor(
            WeatherCondition: weatherModel[dayIndex].airCondition);
        return Container(
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            materialColor[500]!,
            materialColor.shade300,
            materialColor.shade50,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
                  child: Row(
                    children: [
                      dayIndex != 0
                          ? GestureDetector(
                              onTap: () {
                                BlocProvider.of<ChangeDayCubit>(context)
                                    .previousDay();
                              },
                              child: MediumText(
                                text: '<<prev',
                              ),
                            )
                          : Container(),
                      Spacer(),
                      dayIndex < weatherModel[dayIndex].totalDays - 1
                          ? GestureDetector(
                              onTap: () {
                                BlocProvider.of<ChangeDayCubit>(context)
                                    .nextDay();
                              },
                              child: MediumText(
                                text: 'next>>',
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                
                SizedBox(
                  height: 45,
                ),
                BigText(text: 'Day ${dayIndex + 1}'),
                SizedBox(
                  height: 60,
                ),
                BigText(
                  text: weatherModel[0].cityName,
                ),
                MediumText(
                  text:
                      'update at: ${weatherModel[dayIndex].update.hour}:${weatherModel[dayIndex].update.minute}',
                ),
                const VerticalDistance(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CachedImage(
                        imageUrl: weatherModel[dayIndex].imageOfAirCondition),
                    BigText(text: "${weatherModel[dayIndex].avgTemp.round()}"),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SmallText(
                          text:
                              'Max Temp: ${weatherModel[dayIndex].maxTemp.round()}',
                        ),
                        SmallText(
                          text:
                              "Min Temp: ${weatherModel[dayIndex].minTemp.round()}",
                        ),
                      ],
                    )
                  ],
                ),
                const VerticalDistance(5),
                BigText(text: weatherModel[dayIndex].airCondition),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
