import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key});
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
                    CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaomu4Ys4QweFhZY8y8makJDnOkFdgU4li2g&usqp=CAU',
                      imageBuilder: (context, imageProvider) => Container(
                        width: 67.0,
                        height: 58.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Apartment title',
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Apartment Subtitle',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.green,
                          backgroundColor: Colors.green.shade100,
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.person),
                        label: Text('For Owner'))
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia ?.',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 2.0),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaomu4Ys4QweFhZY8y8makJDnOkFdgU4li2g&usqp=CAU',
                      imageBuilder: (context, imageProvider) => Container(
                        width: 24.0,
                        height: 24.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              'Rebecca Moore',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 15),
                            ),
                            Text(
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
        ),
      ),
    );
  }
}
