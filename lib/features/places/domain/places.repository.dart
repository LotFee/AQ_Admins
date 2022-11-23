import 'package:aq_admin/core/failure.core.dart';
import 'package:aq_admin/features/places/domain/entity/city.entity.dart';
import 'package:dartz/dartz.dart';

abstract class PlacesRepository {
  Future<Either<Failure, City>> addCity(City city);
}
