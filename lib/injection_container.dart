import 'package:aq_admin/features/auth/data/auth.repository.impl.dart';
import 'package:aq_admin/features/auth/data/datasource/remote_auth.datasource.dart';
import 'package:aq_admin/features/auth/domain/auth.repository.dart';
import 'package:aq_admin/features/estate/data/datasource/remote_estate.datasource.dart';
import 'package:aq_admin/features/estate/data/estate.repository.impl.dart';
import 'package:aq_admin/features/estate/domain/estate.repository.dart';
import 'package:aq_admin/features/questions/data/datasource/remote_question.datasource.dart';
import 'package:aq_admin/features/questions/data/questions.repository.impl.dart';
import 'package:aq_admin/features/questions/domain/questions.repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

void initiate() {
  sl
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()))
    ..registerLazySingleton<RemoteAuthDataSource>(() => FakeAuthDataSource());
  sl
    ..registerLazySingleton<EstateRepository>(
        () => EstateRepositoryImpl(remoteEstateDataSource: sl()))
    ..registerLazySingleton<RemoteEstateDataSource>(
        () => FakeEstateDataSource());
  sl
    ..registerLazySingleton<QuestionsRepository>(
        () => QuestionsRepositoryImpl(sl()))
    ..registerLazySingleton<RemoteQuestionDataSource>(
        () => FakeQuestionsDataSource());
}

// sl<AuthRepository>().login();
// sl<QuestionRepository>();
// sl<AuthRepositoryImpl>().login();