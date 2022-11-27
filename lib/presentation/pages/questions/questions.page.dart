import 'package:aq_admin/presentation/pages/questions/widget/loading_question_card.widget.dart';
import 'package:aq_admin/presentation/pages/questions/widget/question_card.widget.dart';
import 'package:flutter/material.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
            itemBuilder: (_, __) => const LoadingQuestionCard(),
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemCount: 10),
      ),
    );
  }
}
