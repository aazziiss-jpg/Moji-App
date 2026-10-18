import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kuis Evaluasi')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Pilih romaji yang tepat untuk karakter berikut:',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 48),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.border),
                ),
                child: Center(
                  child: Text(
                    'あ', // Dummy karakter soal
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 64,
                          color: AppTheme.primary,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              _buildOptionButton(context, 'a'),
              const SizedBox(height: 12),
              _buildOptionButton(context, 'i'),
              const SizedBox(height: 12),
              _buildOptionButton(context, 'u'),
              const SizedBox(height: 12),
              _buildOptionButton(context, 'e'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(BuildContext context, String label) {
    return OutlinedButton(
      onPressed: () {}, // Logika State Management akan ditambahkan di Tahap 6
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        side: const BorderSide(color: AppTheme.border, width: 2),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),
      ),
    );
  }
}