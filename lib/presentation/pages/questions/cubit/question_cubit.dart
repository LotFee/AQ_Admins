import 'package:aq_admin/core/failure.core.dart';
import 'package:aq_admin/features/questions/domain/entity/question.entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit() : super(const QuestionInitial());
}
