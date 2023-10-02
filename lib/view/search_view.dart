import 'package:flutter/material.dart';
import '../widget/text_field.dart';



class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text("Search a city"),
      ),
      body: const Center(
        child: SearchTextField(),
      ),
    );
  }
}
