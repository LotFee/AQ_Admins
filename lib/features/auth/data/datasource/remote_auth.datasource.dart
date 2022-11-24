import 'package:aq_admin/features/auth/domain/entity/user.entity.dart';
import 'package:egycoder_faker/egycoder_faker.dart';

abstract class RemoteAuthDataSource {
  Future<User> login(String phone, String password);
  Future<String> forgetPassword(String phone);
  Future<bool> otp(String otp);
  Future<bool> resetPassword(String password);
}

class FakeAuthDataSource extends RemoteAuthDataSource {
  @override
  Future<User> login(String phone, String password) async {
    await Future.delayed(const Duration(seconds: 3));
    return User.fromMap(
      {
        'name': faker.person.name,
        'phone': faker.numberOfLength(11),
        'email': faker.internet.email,
        'jwt': faker.lorem.sentence,
      },
    );
  }

  @override
  Future<String> forgetPassword(String phone) async {
    return faker.numberOfLength(4).toString();
  }

  @override
  Future<bool> otp(String otp) async {
    return faker.boolean;
  }

  @override
  Future<bool> resetPassword(String password) async {
    return faker.boolean;
  }
}
