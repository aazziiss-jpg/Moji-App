import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../data/models/kana_character.dart';

class HiraganaPage extends StatelessWidget {
  const HiraganaPage({super.key});

  // Dummy data awal untuk menguji UI Grid
  static const List<KanaCharacter> _dummyData = [
    KanaCharacter(character: 'あ', romaji: 'a', type: 'hiragana'),
    KanaCharacter(character: 'い', romaji: 'i', type: 'hiragana'),
    KanaCharacter(character: 'う', romaji: 'u', type: 'hiragana'),
    KanaCharacter(character: 'え', romaji: 'e', type: 'hiragana'),
    KanaCharacter(character: 'お', romaji: 'o', type: 'hiragana'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hiragana'),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(24.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: _dummyData.length,
          itemBuilder: (context, index) {
            final kana = _dummyData[index];
            return _buildKanaCard(context, kana);
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
        boxShadow: [
          BoxShadow(
            color: AppTheme.textPrimary.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
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