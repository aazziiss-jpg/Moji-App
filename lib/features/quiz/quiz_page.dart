import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';
import 'quiz_provider.dart';

class QuizPage extends ConsumerWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizState = ref.watch(quizProvider);
    final quizNotifier = ref.read(quizProvider.notifier);

    if (quizState.currentQuestion == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Kuis - Soal ${quizState.questionIndex}'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'Skor: ${quizState.score}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppTheme.primary,
                      fontSize: 16,
                    ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Pilih romaji yang tepat:',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(vertical: 48),
                decoration: BoxDecoration(
                  color: _getFeedbackColor(quizState),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.border),
                ),
                child: Center(
                  child: Text(
                    quizState.currentQuestion!.character,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 64,
                          color: quizState.isAnswered ? AppTheme.background : AppTheme.primary,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              ...quizState.options.map((option) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: _buildOptionButton(context, option, quizState, quizNotifier),
                );
              }),
              const Spacer(),
              if (quizState.isAnswered)
                ElevatedButton(
                  onPressed: () => quizNotifier.nextQuestion(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    foregroundColor: AppTheme.background,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Soal Selanjutnya'),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getFeedbackColor(QuizState state) {
    if (!state.isAnswered) return AppTheme.surface;
    final isCorrect = state.selectedAnswer == state.currentQuestion?.romaji;
    return isCorrect ? Colors.green.shade600 : Colors.red.shade600;
  }

  Widget _buildOptionButton(
    BuildContext context,
    String label,
    QuizState state,
    QuizNotifier notifier,
  ) {
    bool isSelected = state.selectedAnswer == label;
    bool isCorrectAnswer = label == state.currentQuestion?.romaji;

    Color borderColor = AppTheme.border;
    Color textColor = AppTheme.textPrimary;

    if (state.isAnswered) {
      if (isCorrectAnswer) {
        borderColor = Colors.green.shade600;
        textColor = Colors.green.shade600;
      } else if (isSelected && !isCorrectAnswer) {
        borderColor = Colors.red.shade600;
        textColor = Colors.red.shade600;
      }
    }

    return OutlinedButton(
      onPressed: () => notifier.answer(label),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: borderColor, width: 2),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 18,
              color: textColor,
            ),
      ),
    );
  }
}