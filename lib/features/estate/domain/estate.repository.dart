import 'package:aq_admin/core/failure.core.dart';
import 'package:aq_admin/features/estate/domain/entity/estate.entity.dart';
import 'package:dartz/dartz.dart';

abstract class EstateRepository {
  Future<Either<Failure, List<Estate>>> query(int size, int index);
  Future<Either<Failure, Estate>> findOne(String id);
  Future<Either<Failure, Estate>> edit(String id, Estate estate);
  Future<Either<Failure, bool>> decline(String id);
  Future<Either<Failure, Estate>> approve(String id);
  Future<Either<Failure, Estate>> createEstate(Estate estate);
  Future<Either<Failure, List<Estate>>> filterEstates();
}
