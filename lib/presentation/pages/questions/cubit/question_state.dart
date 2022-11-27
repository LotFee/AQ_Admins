part of 'question_cubit.dart';

abstract class QuestionState extends Equatable {
  final List<Question> questions;

  const QuestionState(this.questions);

  @override
  List<Object> get props => [];
}

class QuestionInitial extends QuestionState {
  const QuestionInitial() : super(const []);
}

class QuestionLoadingState extends QuestionState {
  const QuestionLoadingState(super.questions);
}

class QuestionSuccessState extends QuestionState {
  const QuestionSuccessState(super.questions);
}

class QuestionErrorState extends QuestionState {
  final Failure failure;

  const QuestionErrorState(this.failure, super.questions);
}
