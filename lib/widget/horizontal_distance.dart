import 'package:flutter/material.dart';


class HorizontalDistance extends StatelessWidget {
   const HorizontalDistance(  this.w , {super.key}  ) ;
   final double? w ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 10 * (w ?? 1.0) ,
    );
  }
}