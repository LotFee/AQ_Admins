import 'package:aq_admin/core/failure.core.dart';
import 'package:aq_admin/core/logger.core.dart';
import 'package:aq_admin/features/auth/data/datasource/remote_auth.datasource.dart';
import 'package:aq_admin/features/auth/domain/auth.repository.dart';
import 'package:dartz/dartz.dart';
import 'package:aq_admin/features/auth/domain/entity/user.entity.dart';
import 'package:easy_logger/easy_logger.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RemoteAuthDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, User>> login(
    String phoneNumber,
    String password,
  ) async {
    try {
      final user = await remoteDataSource.login(phoneNumber, password);
      logger(user.toMap(), level: LevelMessages.debug);
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, String>> forgetPassword(String phoneNumber) async {
    try {
      final otp = await remoteDataSource.forgetPassword(phoneNumber);
      logger(otp, level: LevelMessages.debug);
      return Right(otp);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> otp(String code) async {
    try {
      final otpResult = await remoteDataSource.otp(code);
      logger(otpResult, level: LevelMessages.debug);
      return Right(otpResult);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> resetPassword(String password) async {
    try {
      final isChanged = await remoteDataSource.resetPassword(password);
      logger(isChanged, level: LevelMessages.debug);
      return Right(isChanged);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
