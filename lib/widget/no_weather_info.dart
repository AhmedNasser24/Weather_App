import 'package:flutter/material.dart';
import 'package:weather_app/widget/medium_text.dart';

class NoWeatherInfo extends StatelessWidget {
  const NoWeatherInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          MediumText( text: " There is no weather 😔",) ,
          SizedBox(
            height: 10 ,
          ),
          MediumText( text: " Start searching now 🔍​",) ,

        ],
      ),
    );
  }
}

