// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aq_admin/core/logger.core.dart';
import 'package:dartz/dartz.dart';

import 'package:aq_admin/core/failure.core.dart';
import 'package:aq_admin/features/auth/data/datasource/remote_auth.datasource.dart';
import 'package:aq_admin/features/estate/data/datasource/remote_estate.datasource.dart';
import 'package:aq_admin/features/estate/domain/entity/estate.entity.dart';
import 'package:aq_admin/features/estate/domain/estate.repository.dart';

class EstateRepositoryImpl extends EstateRepository {
  RemoteEstateDataSource remoteEstateDataSource;
  EstateRepositoryImpl({
    required this.remoteEstateDataSource,
  });
  @override
  Future<Either<Failure, List<Estate>>> query(int size, int index) async {
    try {
      final estates = await remoteEstateDataSource.query(size, index);
      logger.info(estates[1].toJson());
      return Right(estates);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, Estate>> approve(String id) {
    // TODO: implement approve
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Estate>> createEstate(Estate estate) {
    // TODO: implement createEstate
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> decline(String id) {
    // TODO: implement decline
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Estate>> edit(String id, Estate estate) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Estate>>> filterEstates() {
    // TODO: implement filterEstates
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Estate>> findOne(String id) {
    // TODO: implement findOne
    throw UnimplementedError();
  }
}
