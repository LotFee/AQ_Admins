import 'package:aq_admin/features/auth/data/auth.repository.impl.dart';
import 'package:aq_admin/features/auth/data/datasource/remote_auth.datasource.dart';
import 'package:aq_admin/features/auth/domain/auth.repository.dart';
import 'package:aq_admin/features/estate/domain/estate.repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

void initiate() {
  sl
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()))
    ..registerLazySingleton<RemoteAuthDataSource>(() => FakeAuthDataSource());
}

// sl<AuthRepository>().login();
// sl<AuthRepositoryImpl>().login();