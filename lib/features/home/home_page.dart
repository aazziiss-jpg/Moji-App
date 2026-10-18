import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/greeting_util.dart';
import '../../shared/widgets/menu_card.dart';
import '../progress/progress_provider.dart';
import '../profile/profile_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final highScore = ref.watch(highScoreProvider);
    final profileAsync = ref.watch(profileNameProvider);
    final greeting = GreetingUtil.getGreeting();
    final name = profileAsync.maybeWhen(
      data: (data) => data,
      orElse: () => 'Pelajar',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Moji'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: AppTheme.textPrimary),
            onPressed: () => Supabase.instance.client.auth.signOut(),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$greeting,\n$name-san!',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 28,
                      color: AppTheme.primary,
                      height: 1.2,
                    ),
              ),
              const SizedBox(height: 32),
              _buildProgressCard(context, highScore),
              const SizedBox(height: 32),
              Text(
                'Materi Pembelajaran',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              MenuCard(
                title: 'Hiragana',
                subtitle: 'Pelajari 46 karakter dasar',
                icon: Icons.sort_by_alpha,
                onTap: () => context.push('/hiragana'),
              ),
              const SizedBox(height: 16),
              MenuCard(
                title: 'Katakana',
                subtitle: 'Pelajari 46 karakter serapan',
                icon: Icons.language,
                onTap: () => context.push('/katakana'),
              ),
              const SizedBox(height: 16),
              MenuCard(
                title: 'Kuis Evaluasi',
                subtitle: 'Uji kemampuan hafalanmu',
                icon: Icons.quiz,
                onTap: () => context.push('/quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressCard(BuildContext context, int highScore) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Skor Tertinggi Kuis',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Terus tingkatkan skormu!',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: AppTheme.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              highScore.toString(),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 24,
                    color: AppTheme.background,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}