import 'package:aq_admin/features/auth/data/datasource/remote_auth.datasource.dart';
import 'package:aq_admin/features/auth/domain/auth.repository.dart';
import 'package:aq_admin/features/estate/domain/estate.repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

void initiate() {
  sl
    // ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImp())
    ..registerLazySingleton<RemoteAuthDataSource>(() => FakeAuthDataSource());
}

// sl<AuthRepository>().login();