import 'package:flutter/material.dart';

class EstateDetailsPage extends StatelessWidget {
  final String estateId;
  const EstateDetailsPage({
    super.key,
    required this.estateId,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn'
            ':ANd9GcQ5V-jRErp32qvu1f7JrHuRfCFcBxvnbeuVaA&usqp=CAU',
          ),
          Text('Hello, this is Estate $estateId Details page'),
        ],
      ),
    );
  }
}
