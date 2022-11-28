import 'package:aq_admin/core/configuration/pagination.core.dart';
import 'package:aq_admin/core/failure.core.dart';
import 'package:aq_admin/features/questions/domain/entity/question.entity.dart';
import 'package:aq_admin/features/questions/domain/questions.repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  final QuestionsRepository questionsRepository;
  QuestionCubit(this.questionsRepository) : super(const QuestionInitial());
  int currentIndex = defaultPaginationStartIndex;
  bool isLOading = false;
  final List<Question> _questions = [];
  Future<void> getQuestion() async {
    if (isLOading) return;
    isLOading = true;
    emit(QuestionLoadingState(
      _questions,
      isFirstLoading: currentIndex == defaultPaginationStartIndex,
    ));
    final result = await questionsRepository.getQuestions(
        defaultPaginationPageSize, currentIndex);
    result.fold(
      (l) => emit(
        QuestionErrorState(l, _questions),
      ),
      (r) {
        _questions.addAll(r);
        emit(
          QuestionSuccessState(_questions),
        );
      },
    );
    currentIndex++;
    isLOading = false;
  }
}
