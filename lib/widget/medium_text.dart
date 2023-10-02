import 'package:flutter/material.dart';

class MediumText extends StatelessWidget {
  const MediumText({
    super.key, required this.text,
  });
  final String text ;
  @override
  Widget build(BuildContext context) {
    return Text ( text , style: const TextStyle( fontSize: 21 , fontWeight: FontWeight.w500 , color: Color.fromARGB(255, 24, 21, 21)), );
  }
}