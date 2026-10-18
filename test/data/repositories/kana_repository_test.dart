import 'package:flutter_test/flutter_test.dart';
import 'package:moji/data/repositories/kana_repository.dart';

void main() {
  group('KanaRepository Unit Tests', () {
    test('hiraganaData tidak boleh kosong', () {
      final data = KanaRepository.hiraganaData;
      expect(data.isNotEmpty, isTrue);
    });

    test('Data pertama memiliki atribut yang lengkap dan valid', () {
      final firstItem = KanaRepository.hiraganaData.first;
      
      expect(firstItem.character, isNotEmpty);
      expect(firstItem.romaji, isNotEmpty);
      expect(firstItem.type, 'hiragana');
    });
  });
}