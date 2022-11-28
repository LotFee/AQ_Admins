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
  final bool isFirstLoading;
  const QuestionLoadingState(super.questions, {required this.isFirstLoading});
}

class QuestionSuccessState extends QuestionState {
  const QuestionSuccessState(super.questions);
}

class QuestionErrorState extends QuestionState {
  final Failure failure;

  const QuestionErrorState(this.failure, super.questions);
}
