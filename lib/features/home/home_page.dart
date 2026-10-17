import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';
import '../../shared/widgets/menu_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moji'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Konnichiwa!',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 28,
                      color: AppTheme.primary,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Mari lanjutkan belajar huruf Jepang hari ini.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),
              _buildProgressCard(context),
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

  Widget _buildProgressCard(BuildContext context) {
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
                  'Progres Keseluruhan',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 16,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  '0 / 92 Karakter',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  value: 0.0,
                  backgroundColor: AppTheme.border,
                  color: AppTheme.primary,
                  strokeWidth: 8,
                ),
              ),
              Text(
                '0%',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 14,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}