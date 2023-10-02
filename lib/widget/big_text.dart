import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  const BigText({
    super.key, required this.text,
  });
  final String text ;
  @override
  Widget build(BuildContext context) {
    return Text ( text , style: const TextStyle( fontSize: 28 , fontWeight: FontWeight.w700 , color: Color.fromARGB(255, 24, 21, 21)), );
  }
}