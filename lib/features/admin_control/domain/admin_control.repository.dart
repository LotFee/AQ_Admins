import 'package:aq_admin/core/failure.core.dart';
import 'package:aq_admin/features/admin_control/domain/entity/admin.entity.dart';
import 'package:dartz/dartz.dart';

abstract class AdminControlRepository {
  Future<Either<Failure, Admin>> createAdmin(Admin admin);
  Future<Either<Failure, Unit>> createRole(Admin admin);
}
