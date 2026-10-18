import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moji/features/quiz/quiz_provider.dart';
import 'package:moji/features/progress/progress_provider.dart';

class MockHighScoreNotifier extends HighScoreNotifier {
  @override
  int build() => 0;

  @override
  Future<void> updateScore(int newScore) async {
    state = newScore;
  }
}

void main() {
  group('QuizNotifier Unit & Branch Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer(
        overrides: [
          highScoreProvider.overrideWith(MockHighScoreNotifier.new),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('State awal kuis di-generate dengan benar', () {
      final state = container.read(quizProvider);
      
      expect(state.currentQuestion, isNotNull);
      expect(state.options.length, 4);
      expect(state.score, 0);
      expect(state.questionIndex, 1);
      expect(state.isAnswered, isFalse);
    });

    test('Branching: Jawaban benar akan menambah skor', () {
      final notifier = container.read(quizProvider.notifier);
      final stateBefore = container.read(quizProvider);
      final correctAnswer = stateBefore.currentQuestion!.romaji;
      
      notifier.answer(correctAnswer);
      
      final stateAfter = container.read(quizProvider);
      expect(stateAfter.isAnswered, isTrue);
      expect(stateAfter.selectedAnswer, correctAnswer);
      expect(stateAfter.score, 10);
    });

    test('Branching: Jawaban salah tidak menambah skor', () {
      final notifier = container.read(quizProvider.notifier);
      final stateBefore = container.read(quizProvider);
      final correctAnswer = stateBefore.currentQuestion!.romaji;
      final wrongAnswer = stateBefore.options.firstWhere((opt) => opt != correctAnswer);
      
      notifier.answer(wrongAnswer);
      
      final stateAfter = container.read(quizProvider);
      expect(stateAfter.isAnswered, isTrue);
      expect(stateAfter.selectedAnswer, wrongAnswer);
      expect(stateAfter.score, 0);
    });

    test('Lanjut ke soal berikutnya mengubah indeks soal', () {
      final notifier = container.read(quizProvider.notifier);
      
      notifier.nextQuestion();
      
      final stateAfter = container.read(quizProvider);
      expect(stateAfter.questionIndex, 2);
      expect(stateAfter.isAnswered, isFalse);
      expect(stateAfter.selectedAnswer, isNull);
    });
  });
}