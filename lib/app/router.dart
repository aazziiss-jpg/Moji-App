import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moji/features/katakana/katakana_page.dart';
import 'package:moji/features/quiz/quiz_page.dart';
import '../features/home/home_page.dart';
import '../features/hiragana/hiragana_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../features/auth/auth_page.dart';

final authStateProvider = StreamProvider<AuthState>((ref) {
  return Supabase.instance.client.auth.onAuthStateChange;
});

final routerProvider = Provider<GoRouter>((ref) {
  ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final session = Supabase.instance.client.auth.currentSession;
      final isAuthRoute = state.matchedLocation == '/auth';

      if (session == null && !isAuthRoute) return '/auth';
      if (session != null && isAuthRoute) return '/';
      return null;
    },
    routes: [
      GoRoute(path: '/auth', builder: (context, state) => const AuthPage()),
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(path: '/hiragana', builder: (context, state) => const HiraganaPage()),
      GoRoute(path: '/katakana', builder: (context, state) => const KatakanaPage()),
      GoRoute(path: '/quiz', builder: (context, state) => const QuizPage()),
    ],
  );
});

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