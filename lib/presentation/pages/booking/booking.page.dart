import 'package:flutter/material.dart';
class BookingPage extends StatelessWidget {
  const BookingPage({super.key});
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
          const Text('Hello, this is Booking page'),
        ],
      ),
    );
  }
}
