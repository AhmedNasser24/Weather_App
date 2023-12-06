import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/change_day/change_day.dart';
import 'package:weather_app/widget/small_text.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({
    super.key,
  });
  final _searchKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    late String cityName;
    late String numberOfDays ;
    return Form(
      key: _searchKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please , enter a city name';
                  }
                  return null;
                },
                onChanged: (value) {
                  cityName = value;
                },
                style: const TextStyle(color: Colors.black, fontSize: 18),
                // style of input text
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 32,
                    ),
                    suffixIcon: Icon(Icons.search),
                    hintText: 'enter a city',
                    label: const Text(
                      "search city",
                      style: TextStyle(fontSize: 17),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  SmallText(text: 'you can get up to 10 days from today'),
                  Spacer()
                ],
              ),
              SizedBox(
                height: 5 ,
              ),
              TextFormField(
                onChanged: (value) {
                  numberOfDays = value ;
                },
                validator: (value) {
                  RegExp numeric = RegExp(r'^[0-9]+$');
                  if (value!.isEmpty) {
                    return 'please , enter number of days';
                  }
                  else if (!numeric.hasMatch(value)) {
                    
                    return 'enter numbers only , not character' ;
                  } 
                  int day = int.parse(value) ;
                  if ( day < 1 || day > 10){
                    return 'Invalid input, days must be between 1 and 10' ;
                  }
                  
                  return null ;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(vertical : 32 , horizontal: 16),
                    hintText: 'enter number of days',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6))),
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_searchKey.currentState!.validate()) {
                      BlocProvider.of<GetWeatherCubit>(context)
                          .getWeather(cityName: cityName ,numberOfDays: int.parse(numberOfDays)); // convert string into integar
                      BlocProvider.of<ChangeDayCubit>(context).initializeDay();
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Get Weather',
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
