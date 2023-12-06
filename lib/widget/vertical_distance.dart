import 'package:flutter/material.dart';

class VerticalDistance extends StatelessWidget {
   const VerticalDistance(  this.h , {super.key}  ) ;
   final double? h ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10 * (h ?? 1.0) ,
    );
  }
}