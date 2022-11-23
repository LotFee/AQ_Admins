import 'package:aq_admin/core/failure.core.dart';
import 'package:aq_admin/features/booking/domain/entity/booking.entity.dart';
import 'package:dartz/dartz.dart';

abstract class BookingRepository {
  Future<Either<Failure, bool>> book(String id);
  Future<Either<Failure, bool>> negotiate(String id, double price);
  Future<Either<Failure, bool>> edit(String id);
  Future<Either<Failure, bool>> approve(String id);
  Future<Either<Failure, bool>> decline(String id);
}
