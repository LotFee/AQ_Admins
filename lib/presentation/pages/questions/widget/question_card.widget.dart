import 'package:aq_admin/features/questions/domain/entity/question.entity.dart';
import 'package:aq_admin/presentation/widgets/loading.widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  const QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const Loading(width: 67.0, height: 58.0, radius: 10),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    fit: BoxFit.cover,
                    imageUrl: question.image!,
                    width: 67.0,
                    height: 58.0,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        question.apartmentTitle!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        question.apartmentSubtitle!,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    foregroundColor: Colors.green,
                    backgroundColor: Colors.green.shade100,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.person),
                  label: const Text('For Owner'),
                )
              ],
            ),
            const SizedBox(height: 15),
            Text(
              question.body!,
              maxLines: 2,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(thickness: 2.0),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const Loading(width: 24, height: 24, radius: 50),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    fit: BoxFit.cover,
                    imageUrl: question.bookerImage!,
                    width: 24,
                    height: 24,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          question.bookerName!,
                          style: const TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 15),
                        ),
                        const Text(
                          ' (Booker)',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 10,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      '14/04/2022  12:00 AM',
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xff0AB28B),
                    ),
                    onPressed: () {},
                    child: const Text('Accept')),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(width: 1.0, color: Colors.red),
                      elevation: 0,
                      foregroundColor: Colors.red,
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: const Text('Decline')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
