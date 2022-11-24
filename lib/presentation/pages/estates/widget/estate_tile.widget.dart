import 'package:aq_admin/features/estate/domain/entity/estate.entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class EstateTile extends StatelessWidget {
  final Estate estate;
  const EstateTile(this.estate, {super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          CachedNetworkImage(
            placeholder: (context, url) => const SkeletonAvatar(),
            errorWidget: (context, url, error) => const Center(
              child: Icon(
                Icons.error,
                color: Colors.red,
              ),
            ),
            imageUrl: estate.image!,
            width: 200,
            height: 200,
          ),
          //Text('Estate ${index + 1}'),
          Text(estate.price!.toStringAsFixed(2)),
          Text(estate.title!),
          Text(estate.subtitle!),
        ],
      ),
    );
  }
}
