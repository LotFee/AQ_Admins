import 'package:egycoder_faker/egycoder_faker.dart';
import 'package:flutter/material.dart';

class GetStartPage extends StatelessWidget {
  const GetStartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          Image.network(faker.image.network(keywords: ['smile', 'animal'])),
          const Text('Hello, this is GetStart page'),
        ],
      ),
    );
  }
}
