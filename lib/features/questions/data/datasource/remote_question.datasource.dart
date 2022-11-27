import 'package:aq_admin/core/logger.core.dart';
import 'package:aq_admin/features/questions/domain/entity/question.entity.dart';
import 'package:dartz/dartz.dart';
import 'package:egycoder_faker/egycoder_faker.dart';
import 'package:easy_logger/easy_logger.dart';

abstract class RemoteQuestionDataSource {
  Future<List<Question>> getQuestion(int size, int index);
}

class FakeQuestionsDataSource extends RemoteQuestionDataSource {
  @override
  Future<List<Question>> getQuestion(int size, int index) async {
    logger.info('hello');
    await Future.delayed(
      const Duration(seconds: 3),
    );
    return List<Question>.generate(
      10,
      (index) => Question.fromMap(
        {
          'id': faker.numberOfLength(5),
          'image': faker.image.network(keywords: ['apartments']),
          'apartmentTitle': faker.lorem.words(2).join(' '),
          'apartmentSubtitle': faker.lorem.words(5).join(' '),
          'body': faker.lorem.sentence,
          'bookerImage': faker.image.network(keywords: ['person']),
          'bookerName': faker.person.name,
        },
      ),
    );
  }
}
