import 'package:aq_admin/core/failure.core.dart';
import 'package:aq_admin/features/estate/domain/entity/estate.entity.dart';
import 'package:dartz/dartz.dart';
import 'package:egycoder_faker/egycoder_faker.dart';

abstract class RemoteEstateDataSource {
  Future<List<Estate>> query(int size, int index);
}

class FakeEstateDataSource extends RemoteEstateDataSource {
  @override
  Future<List<Estate>> query(int size, int index) async {
    await Future.delayed(const Duration(seconds: 3));
    return List<Estate>.generate(
      10,
      (index) => Estate.fromMap(
        {
          'title': faker.lorem.sentence,
          'subtitle': faker.lorem.sentence,
          'price': faker.decimal(min: 2000, max: 4000),
          'image': faker.image.network(keywords: ['house']),
        },
      ),
    );
  }
}
