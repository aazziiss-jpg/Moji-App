import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moji/features/katakana/katakana_page.dart';
import 'package:moji/features/quiz/quiz_page.dart';
import '../features/home/home_page.dart';
import '../features/hiragana/hiragana_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/hiragana',
      builder: (context, state) => const HiraganaPage(),
    ),
    GoRoute(
      path: '/katakana',
      builder: (context, state) => const KatakanaPage(),
    ),
    GoRoute(
      path: '/quiz',
      builder: (context, state) => const QuizPage(),
    ),
  ],
);

class PlaceholderHome extends StatelessWidget {
  const PlaceholderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moji'),
      ),
      body: const Center(
        child: Text(
          'Fondasi Aplikasi Selesai\nSiap untuk UI Home',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}