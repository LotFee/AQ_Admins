import 'package:aq_admin/presentation/widgets/loading.widget.dart';
import 'package:flutter/material.dart';

class LoadingEstateTile extends StatelessWidget {
  const LoadingEstateTile({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Loading(width: 200, height: 200, radius: 0),
          SizedBox(height: 4),
          Loading(width: 10, height: 12, radius: 0),
          SizedBox(height: 4),
          Loading(width: 20, height: 12, radius: 0),
          SizedBox(height: 4),
          Loading(width: 80, height: 12, radius: 0),
        ],
      ),
    );
  }
}
