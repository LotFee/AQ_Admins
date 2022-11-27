import 'package:aq_admin/core/logger.core.dart';
import 'package:aq_admin/features/questions/data/datasource/remote_question.datasource.dart';
import 'package:aq_admin/features/questions/domain/entity/question.entity.dart';
import 'package:aq_admin/core/failure.core.dart';
import 'package:aq_admin/features/questions/domain/questions.repository.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_logger/easy_logger.dart';

class QuestionsRepositoryImpl extends QuestionsRepository {
  final RemoteQuestionDataSource remoteQuestionDataSource;

  QuestionsRepositoryImpl(this.remoteQuestionDataSource);
  @override
  Future<Either<Failure, List<Question>>> getQuestions(
      int size, int index) async {
    try {
      final questions = await remoteQuestionDataSource.getQuestion(size, index);
      logger.info(questions[0].toJson());
      return Right(questions);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
