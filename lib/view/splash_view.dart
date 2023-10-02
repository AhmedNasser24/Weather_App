import 'package:flutter/material.dart';
import 'package:weather_app/view/home_view.dart';
import 'package:weather_app/widget/medium_text.dart';
import 'package:weather_app/widget/vertical_distance.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeView(),
        ),
      ),
    );
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        // width: double.infinity,
        height: double.infinity,
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
          FadeTransition(
            opacity: _animationController,
            child: ClipRRect(
              child: Image.asset('assets/images/weather_icon.png'),
            ),
          ),
          VerticalDistance(4) ,
          MediumText(text: 'Get Daily Weather',)
        ],),
      ),
    );
  }
}
