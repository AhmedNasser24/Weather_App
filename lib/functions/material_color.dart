import 'package:flutter/material.dart';

MaterialColor whiteMaterialColor = const MaterialColor(0xFFFFFFFF, {
  50: Colors.white,
  100: Colors.white,
  200: Colors.white,
  300: Colors.white,
  400: Colors.white,
  500: Colors.white,
  600: Colors.white,
  700: Colors.white,
  800: Colors.white,
  900: Colors.white,
});
// Define a mapping of weather conditions to MaterialColor
Map<String, MaterialColor> weatherConditionColors = {
  "Sunny": Colors.yellow,
  "Clear": Colors.green,
  "Partly cloudy": Colors.grey,
  "Cloudy": Colors.grey,
  "Overcast": Colors.grey,
  "Mist": Colors.grey,
  "Patchy rain possible": Colors.blue,
  "Patchy snow possible": whiteMaterialColor,
  "Patchy sleet possible": whiteMaterialColor,
  "Patchy freezing drizzle possible": whiteMaterialColor,
  "Thundery outbreaks possible": Colors.red,
  "Blowing snow": whiteMaterialColor,
  "Blizzard": whiteMaterialColor,
  "Fog": Colors.grey,
  "Freezing fog": whiteMaterialColor,
  "Patchy light drizzle": Colors.blue,
  "Light drizzle": Colors.blue,
  "Freezing drizzle": Colors.blue,
  "Heavy freezing drizzle": Colors.blue,
  "Patchy light rain": Colors.blue,
  "Light rain": Colors.blue,
  "Moderate rain at times": Colors.blue,
  "Moderate rain": Colors.blue,
  "Heavy rain at times": Colors.blue,
  "Heavy rain": Colors.blue,
  "Light freezing rain": Colors.blue,
  "Moderate or heavy freezing rain": Colors.blue,
  "Light sleet": Colors.blue,
  "Moderate or heavy sleet": Colors.blue,
  "Patchy light snow": whiteMaterialColor,
  "Light snow": whiteMaterialColor,
  "Patchy moderate snow": whiteMaterialColor,
  "Moderate snow": whiteMaterialColor,
  "Patchy heavy snow": whiteMaterialColor,
  "Heavy snow": whiteMaterialColor,
  "Ice pellets": whiteMaterialColor,
  "Light rain shower": Colors.blue,
  "Moderate or heavy rain shower": Colors.blue,
  "Torrential rain shower": Colors.blue,
  "Light sleet showers": Colors.blue,
  "Moderate or heavy sleet showers": Colors.blue,
  "Light snow showers": whiteMaterialColor,
  "Moderate or heavy snow showers": whiteMaterialColor,
  "Light showers of ice pellets": whiteMaterialColor,
  "Moderate or heavy showers of ice pellets": whiteMaterialColor,
  "Patchy light rain with thunder": Colors.red,
  "Moderate or heavy rain with thunder": Colors.red,
  "Patchy light snow with thunder": Colors.red,
  "Moderate or heavy snow with thunder": Colors.red,
};

MaterialColor getMaterialColor({required String WeatherCondition}) {
  MaterialColor whiteMaterialColor = const MaterialColor(0xFFFFFFFF, {
    50: Colors.white,
    100: Colors.white,
    200: Colors.white,
    300: Colors.white,
    400: Colors.white,
    500: Colors.white,
    600: Colors.white,
    700: Colors.white,
    800: Colors.white,
    900: Colors.white,
  });
  // Define a mapping of weather conditions to MaterialColor
  Map<String, MaterialColor> weatherConditionColors = {
    "Sunny": Colors.yellow,
    "Clear": Colors.green,
    "Partly cloudy": Colors.grey,
    "Cloudy": Colors.grey,
    "Overcast": Colors.grey,
    "Mist": Colors.grey,
    "Patchy rain possible": Colors.blue,
    "Patchy snow possible": whiteMaterialColor,
    "Patchy sleet possible": whiteMaterialColor,
    "Patchy freezing drizzle possible": whiteMaterialColor,
    "Thundery outbreaks possible": Colors.red,
    "Blowing snow": whiteMaterialColor,
    "Blizzard": whiteMaterialColor,
    "Fog": Colors.grey,
    "Freezing fog": whiteMaterialColor,
    "Patchy light drizzle": Colors.blue,
    "Light drizzle": Colors.blue,
    "Freezing drizzle": Colors.blue,
    "Heavy freezing drizzle": Colors.blue,
    "Patchy light rain": Colors.blue,
    "Light rain": Colors.blue,
    "Moderate rain at times": Colors.blue,
    "Moderate rain": Colors.blue,
    "Heavy rain at times": Colors.blue,
    "Heavy rain": Colors.blue,
    "Light freezing rain": Colors.blue,
    "Moderate or heavy freezing rain": Colors.blue,
    "Light sleet": Colors.blue,
    "Moderate or heavy sleet": Colors.blue,
    "Patchy light snow": whiteMaterialColor,
    "Light snow": whiteMaterialColor,
    "Patchy moderate snow": whiteMaterialColor,
    "Moderate snow": whiteMaterialColor,
    "Patchy heavy snow": whiteMaterialColor,
    "Heavy snow": whiteMaterialColor,
    "Ice pellets": whiteMaterialColor,
    "Light rain shower": Colors.blue,
    "Moderate or heavy rain shower": Colors.blue,
    "Torrential rain shower": Colors.blue,
    "Light sleet showers": Colors.blue,
    "Moderate or heavy sleet showers": Colors.blue,
    "Light snow showers": whiteMaterialColor,
    "Moderate or heavy snow showers": whiteMaterialColor,
    "Light showers of ice pellets": whiteMaterialColor,
    "Moderate or heavy showers of ice pellets": whiteMaterialColor,
    "Patchy light rain with thunder": Colors.red,
    "Moderate or heavy rain with thunder": Colors.red,
    "Patchy light snow with thunder": Colors.red,
    "Moderate or heavy snow with thunder": Colors.red,
  };

  return weatherConditionColors[WeatherCondition] ?? Colors.blue;
}
