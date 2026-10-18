import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/kana_character.dart';
import '../../data/repositories/kana_repository.dart';
import '../progress/progress_provider.dart';

class QuizState {
  final KanaCharacter? currentQuestion;
  final List<String> options;
  final int score;
  final int questionIndex;
  final bool isAnswered;
  final String? selectedAnswer;

  const QuizState({
    this.currentQuestion,
    this.options = const [],
    this.score = 0,
    this.questionIndex = 1,
    this.isAnswered = false,
    this.selectedAnswer,
  });

  QuizState copyWith({
    KanaCharacter? currentQuestion,
    List<String>? options,
    int? score,
    int? questionIndex,
    bool? isAnswered,
    String? selectedAnswer,
  }) {
    return QuizState(
      currentQuestion: currentQuestion ?? this.currentQuestion,
      options: options ?? this.options,
      score: score ?? this.score,
      questionIndex: questionIndex ?? this.questionIndex,
      isAnswered: isAnswered ?? this.isAnswered,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
    );
  }
}

class QuizNotifier extends Notifier<QuizState> {
  @override
  QuizState build() {
    return _generateInitialState();
  }

  QuizState _generateInitialState() {
    final random = Random();
    final kanaList = KanaRepository.hiraganaData;
    final question = kanaList[random.nextInt(kanaList.length)];

    List<String> newOptions = [question.romaji];
    while (newOptions.length < 4) {
      final wrongOption = kanaList[random.nextInt(kanaList.length)].romaji;
      if (!newOptions.contains(wrongOption)) {
        newOptions.add(wrongOption);
      }
    }
    newOptions.shuffle();

    return QuizState(
      currentQuestion: question,
      options: newOptions,
      isAnswered: false,
      selectedAnswer: null,
    );
  }

  void generateQuestion() {
    state = _generateInitialState().copyWith(
      score: state.score,
      questionIndex: state.questionIndex,
    );
  }

  void answer(String selected) {
    if (state.isAnswered) return;

    final isCorrect = selected == state.currentQuestion?.romaji;
    final newScore = isCorrect ? state.score + 10 : state.score;

    state = state.copyWith(
      isAnswered: true,
      selectedAnswer: selected,
      score: newScore,
    );

    ref.read(highScoreProvider.notifier).updateScore(newScore);
  }

  void nextQuestion() {
    state = state.copyWith(questionIndex: state.questionIndex + 1);
    generateQuestion();
  }

  void resetQuiz() {
    state = _generateInitialState();
  }
}

final quizProvider = NotifierProvider<QuizNotifier, QuizState>(QuizNotifier.new);