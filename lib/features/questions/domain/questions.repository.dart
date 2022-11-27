import 'package:aq_admin/core/failure.core.dart';
import 'package:aq_admin/features/questions/domain/entity/question.entity.dart';
import 'package:dartz/dartz.dart';

abstract class QuestionsRepository {
  /// this method get all questions of apartments that the admin decide to approve that question or not.
  ///
  /// if there is found a failure that will return in the left.
  /// else return list of questions in the right.
  Future<Either<Failure, List<Question>>> getQuestions(int size, int index);
}
