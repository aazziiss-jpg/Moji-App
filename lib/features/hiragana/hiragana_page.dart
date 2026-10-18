import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../data/models/kana_character.dart';
import '../../data/repositories/kana_repository.dart';

class HiraganaPage extends StatelessWidget {
  const HiraganaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = KanaRepository.hiraganaData; // Menggunakan data asli dari repository

    return Scaffold(
      appBar: AppBar(title: const Text('Hiragana')),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(24.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return _buildKanaCard(context, data[index]);
          },
        ),
      ),
    );
  }

  Widget _buildKanaCard(BuildContext context, KanaCharacter kana) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            kana.character,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 28,
                  color: AppTheme.primary,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            kana.romaji,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}