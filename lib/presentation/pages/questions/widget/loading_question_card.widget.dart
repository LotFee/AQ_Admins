import 'package:aq_admin/presentation/widgets/loading.widget.dart';
import 'package:flutter/material.dart';

class LoadingQuestionCard extends StatelessWidget {
  const LoadingQuestionCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Loading(width: 67.0, height: 58.0, radius: 10),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Loading(width: 100, height: 20),
                        SizedBox(height: 5),
                        Loading(width: 100, height: 15),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Loading(width: double.infinity, height: 10),
                const SizedBox(height: 5),
                const Loading(width: double.infinity, height: 10),
                const SizedBox(height: 10),
                const Divider(thickness: 2.0),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Loading(width: 24, height: 24, radius: 50),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Loading(width: 60, height: 20),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Loading(width: 30, height: 10),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
