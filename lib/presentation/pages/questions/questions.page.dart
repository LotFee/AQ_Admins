import 'package:aq_admin/core/logger.core.dart';
import 'package:aq_admin/core/responsive.core.dart';
import 'package:aq_admin/presentation/pages/questions/cubit/question_cubit.dart';
import 'package:aq_admin/presentation/pages/questions/widget/loading_question_card.widget.dart';
import 'package:aq_admin/presentation/pages/questions/widget/question_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  final scrollController = ScrollController();
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      scrollController.addListener(() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent / 2) {
          context.read<QuestionCubit>().getQuestion();
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<QuestionCubit, QuestionState>(
          listener: (context, state) {
            if (state is QuestionErrorState) {
              logger.error(state.failure.error);
            }
          },
          builder: (context, state) {
            bool appendOneMore = false;
            if (state is QuestionLoadingState) {
              if (state.isFirstLoading) {
                return ListView.separated(
                    itemBuilder: (_, __) => const LoadingQuestionCard(),
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemCount: 10);
              } else {
                appendOneMore = true;
              }
            }
            if (state.questions.isEmpty) {
              return const Center(child: Text('There is no Questions yet.'));
            }
            return MasonryGridView.count(
              controller: scrollController,
              crossAxisCount: responsiveNumber(context, 1, 2, 3),
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemBuilder: (_, index) {
                if (index < state.questions.length) {
                  return QuestionCard(question: state.questions[index]);
                }
                return const LoadingQuestionCard();
              },
              itemCount: state.questions.length + (appendOneMore ? 1 : 0),
            );
          },
        ),
      ),
    );
  }
}
