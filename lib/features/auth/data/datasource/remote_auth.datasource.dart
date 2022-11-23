import 'package:aq_admin/features/auth/domain/entity/user.entity.dart';
import 'package:egycoder_faker/egycoder_faker.dart';

abstract class RemoteAuthDataSource {
  Future<List<User>> login(String phone, String password);
}

class FakeAuthDataSource extends RemoteAuthDataSource {
  @override
  Future<List<User>> login(String phone, String password) async {
    return List.generate(
      10,
      (index) => User.fromMap(
        {
          'name': faker.person.name,
          'phone': faker.numberOfLength(11),
          'email': faker.internet.email,
          'jwt': faker.lorem.sentence,
        },
      ),
    );
  }
}
