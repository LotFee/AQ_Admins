import 'package:aq_admin/core/failure.core.dart';
import 'package:aq_admin/features/auth/domain/entity/user.entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  /// this method will login admin into system using phone number and password
  ///
  /// if phone number and password is correct it will return 204 status code
  /// and send otp code to admin.
  /// then you need call [otp] method
  ///
  /// else it will return remote failure error
  Future<Either<Failure, User>> login(String phoneNumber, String password);

  /// this method helps admin to get [otp] code using his phone number
  ///
  /// if the phone number is correct it will return otp code.
  ///
  /// else it will return failure error
  Future<Either<Failure, String>> forgetPassword(String phoneNumber);

  /// this method helps admin to ensure that the otp is true or not

  Future<Either<Failure, bool>> otp(String code);

  /// this method help admins to  change his password.
  Future<Either<Failure, bool>> resetPassword(String password);
}
