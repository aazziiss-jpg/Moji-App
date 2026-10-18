import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

class HighScoreNotifier extends Notifier<int> {
  static const _key = 'high_score';
  final _supabase = Supabase.instance.client;

  @override
  int build() {
    _syncFromCloud();
    final prefs = ref.watch(sharedPreferencesProvider);
    return prefs.getInt(_key) ?? 0;
  }

  Future<void> _syncFromCloud() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return;

    try {
      final response = await _supabase
          .from('user_progress')
          .select('high_score')
          .eq('user_id', user.id)
          .maybeSingle();

      if (response != null && response['high_score'] != null) {
        final cloudScore = response['high_score'] as int;
        final prefs = ref.read(sharedPreferencesProvider);
        final localScore = prefs.getInt(_key) ?? 0;

        if (cloudScore > localScore) {
          await prefs.setInt(_key, cloudScore);
          state = cloudScore;
        } else if (localScore > cloudScore) {
          await _updateCloudScore(localScore);
        }
      }
    } catch (_) {}
  }

  Future<void> updateScore(int newScore) async {
    if (newScore > state) {
      state = newScore;
      final prefs = ref.read(sharedPreferencesProvider);
      await prefs.setInt(_key, newScore);
      await _updateCloudScore(newScore);
    }
  }

  Future<void> _updateCloudScore(int score) async {
    final user = _supabase.auth.currentUser;
    if (user == null) return;

    try {
      await _supabase.from('user_progress').upsert({
        'user_id': user.id,
        'high_score': score,
        'updated_at': DateTime.now().toUtc().toIso8601String(),
      });
    } catch (_) {}
  }
}

final highScoreProvider = NotifierProvider<HighScoreNotifier, int>(HighScoreNotifier.new);