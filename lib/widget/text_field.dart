import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/get_weather_cubit/get_weather_cubit.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late String cityName;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          cityName = value;
        },
        onSubmitted: (value) {
          BlocProvider.of<GetWeatherCubit>(context).getWeather(cityName: value);

          Navigator.pop(context);
        },
        style: const TextStyle(color: Colors.black, fontSize: 18),
        // style of input text
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                BlocProvider.of<GetWeatherCubit>(context)
                    .getWeather(cityName: cityName);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.search),
            ),
            hintText: 'enter a city',
            label: const Text(
              "search city",
              style: TextStyle(fontSize: 17),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            )
            // enabledBorder: OutlineInputBorder(
            //   borderSide: const BorderSide(
            //     // color: Color(0xffF7A847),
            //     width: 1,
            //   ),
            //   borderRadius: BorderRadius.circular(8),
            // ),
            // focusedBorder: OutlineInputBorder(
            //   borderSide: const BorderSide(
            //     color: Colors.orange,
            //     width: 2,
            //   ),
            //   borderRadius: BorderRadius.circular(8),
            // ),
            ),
      ),
    );
  }
}
