import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

class HighScoreNotifier extends Notifier<int> {
  static const _key = 'high_score';

  @override
  int build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return prefs.getInt(_key) ?? 0;
  }

  Future<void> updateScore(int newScore) async {
    if (newScore > state) {
      state = newScore;
      final prefs = ref.read(sharedPreferencesProvider);
      await prefs.setInt(_key, newScore);
    }
  }
}

final highScoreProvider = NotifierProvider<HighScoreNotifier, int>(HighScoreNotifier.new);