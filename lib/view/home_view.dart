import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/change_theme_color_cubit/change_theme_color_cubit.dart';
import 'package:weather_app/functions/material_color.dart';
import 'package:weather_app/view/search_view.dart';
import 'package:weather_app/widget/horizontal_distance.dart';
import 'package:weather_app/widget/medium_text.dart';
import 'package:weather_app/widget/no_weather_info.dart';
import 'package:weather_app/widget/weather_info.dart';

import '../cubit/get_weather_cubit/get_weather_cubit.dart';
import '../cubit/get_weather_cubit/get_weather_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        actions: [
          const HorizontalDistance(1),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchView(),
                  ),
                );
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is FailureWeatherState) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MediumText(text: state.errorMessage),
              ),
            );
          } else if (state is LoadingWeatherState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SuccessWeatherState) {
            BlocProvider.of<ChangeThemeColorCubit>(context).changeThemeColor(
                weatherCondition: state.weatherModel.airCondition); // read notes on this cubit
            MaterialColor weatherColor =
                weatherConditionColors[state.weatherModel.airCondition] ??
                    Colors.green;
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    weatherColor[500]!,
                    weatherColor[50]!,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                
              ),
              child: WeatherInfo(
                weatherModel: state.weatherModel,
              ),
            );
          } else {
            return const NoWeatherInfo();
          }
        },
      ),
    );
  }
}
