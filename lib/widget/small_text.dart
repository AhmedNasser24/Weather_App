import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  const SmallText({
    super.key, required this.text,
  });
  final String text ;
  @override
  Widget build(BuildContext context) {
    return Text ( text , style: const TextStyle( fontSize: 13 , fontWeight: FontWeight.w500 , color: Color.fromARGB(255, 24, 21, 21)), );
  }
}