
import '../models/kana_character.dart';

class KanaRepository {
  static const List<KanaCharacter> hiraganaData = [
    KanaCharacter(character: 'あ', romaji: 'a', type: 'hiragana'),
    KanaCharacter(character: 'い', romaji: 'i', type: 'hiragana'),
    KanaCharacter(character: 'う', romaji: 'u', type: 'hiragana'),
    KanaCharacter(character: 'え', romaji: 'e', type: 'hiragana'),
    KanaCharacter(character: 'お', romaji: 'o', type: 'hiragana'),

    KanaCharacter(character: 'か', romaji: 'ka', type: 'hiragana'),
    KanaCharacter(character: 'き', romaji: 'ki', type: 'hiragana'),
    KanaCharacter(character: 'く', romaji: 'ku', type: 'hiragana'),
    KanaCharacter(character: 'け', romaji: 'ke', type: 'hiragana'),
    KanaCharacter(character: 'こ', romaji: 'ko', type: 'hiragana'),

    KanaCharacter(character: 'さ', romaji: 'sa', type: 'hiragana'),
    KanaCharacter(character: 'し', romaji: 'shi', type: 'hiragana'),
    KanaCharacter(character: 'す', romaji: 'su', type: 'hiragana'),
    KanaCharacter(character: 'せ', romaji: 'se', type: 'hiragana'),
    KanaCharacter(character: 'そ', romaji: 'so', type: 'hiragana'),

    KanaCharacter(character: 'た', romaji: 'ta', type: 'hiragana'),
    KanaCharacter(character: 'ち', romaji: 'chi', type: 'hiragana'),
    KanaCharacter(character: 'つ', romaji: 'tsu', type: 'hiragana'),
    KanaCharacter(character: 'て', romaji: 'te', type: 'hiragana'),
    KanaCharacter(character: 'と', romaji: 'to', type: 'hiragana'),

    KanaCharacter(character: 'な', romaji: 'na', type: 'hiragana'),
    KanaCharacter(character: 'に', romaji: 'ni', type: 'hiragana'),
    KanaCharacter(character: 'ぬ', romaji: 'nu', type: 'hiragana'),
    KanaCharacter(character: 'ね', romaji: 'ne', type: 'hiragana'),
    KanaCharacter(character: 'の', romaji: 'no', type: 'hiragana'),

    KanaCharacter(character: 'は', romaji: 'ha', type: 'hiragana'),
    KanaCharacter(character: 'ひ', romaji: 'hi', type: 'hiragana'),
    KanaCharacter(character: 'ふ', romaji: 'fu', type: 'hiragana'),
    KanaCharacter(character: 'へ', romaji: 'he', type: 'hiragana'),
    KanaCharacter(character: 'ほ', romaji: 'ho', type: 'hiragana'),

    KanaCharacter(character: 'ま', romaji: 'ma', type: 'hiragana'),
    KanaCharacter(character: 'み', romaji: 'mi', type: 'hiragana'),
    KanaCharacter(character: 'む', romaji: 'mu', type: 'hiragana'),
    KanaCharacter(character: 'め', romaji: 'me', type: 'hiragana'),
    KanaCharacter(character: 'も', romaji: 'mo', type: 'hiragana'),

    KanaCharacter(character: 'や', romaji: 'ya', type: 'hiragana'),
    KanaCharacter(character: 'ゆ', romaji: 'yu', type: 'hiragana'),
    KanaCharacter(character: 'よ', romaji: 'yo', type: 'hiragana'),

    KanaCharacter(character: 'ら', romaji: 'ra', type: 'hiragana'),
    KanaCharacter(character: 'り', romaji: 'ri', type: 'hiragana'),
    KanaCharacter(character: 'る', romaji: 'ru', type: 'hiragana'),
    KanaCharacter(character: 'れ', romaji: 're', type: 'hiragana'),
    KanaCharacter(character: 'ろ', romaji: 'ro', type: 'hiragana'),

    KanaCharacter(character: 'わ', romaji: 'wa', type: 'hiragana'),
    KanaCharacter(character: 'を', romaji: 'wo', type: 'hiragana'),
    KanaCharacter(character: 'ん', romaji: 'n', type: 'hiragana'),

    KanaCharacter(character: 'が', romaji: 'ga', type: 'hiragana'),
    KanaCharacter(character: 'ぎ', romaji: 'gi', type: 'hiragana'),
    KanaCharacter(character: 'ぐ', romaji: 'gu', type: 'hiragana'),
    KanaCharacter(character: 'げ', romaji: 'ge', type: 'hiragana'),
    KanaCharacter(character: 'ご', romaji: 'go', type: 'hiragana'),

    KanaCharacter(character: 'ざ', romaji: 'za', type: 'hiragana'),
    KanaCharacter(character: 'じ', romaji: 'ji', type: 'hiragana'),
    KanaCharacter(character: 'ず', romaji: 'zu', type: 'hiragana'),
    KanaCharacter(character: 'ぜ', romaji: 'ze', type: 'hiragana'),
    KanaCharacter(character: 'ぞ', romaji: 'zo', type: 'hiragana'),

    KanaCharacter(character: 'だ', romaji: 'da', type: 'hiragana'),
    KanaCharacter(character: 'ぢ', romaji: 'ji', type: 'hiragana'),
    KanaCharacter(character: 'づ', romaji: 'zu', type: 'hiragana'),
    KanaCharacter(character: 'で', romaji: 'de', type: 'hiragana'),
    KanaCharacter(character: 'ど', romaji: 'do', type: 'hiragana'),

    KanaCharacter(character: 'ば', romaji: 'ba', type: 'hiragana'),
    KanaCharacter(character: 'び', romaji: 'bi', type: 'hiragana'),
    KanaCharacter(character: 'ぶ', romaji: 'bu', type: 'hiragana'),
    KanaCharacter(character: 'べ', romaji: 'be', type: 'hiragana'),
    KanaCharacter(character: 'ぼ', romaji: 'bo', type: 'hiragana'),

    KanaCharacter(character: 'ぱ', romaji: 'pa', type: 'hiragana'),
    KanaCharacter(character: 'ぴ', romaji: 'pi', type: 'hiragana'),
    KanaCharacter(character: 'ぷ', romaji: 'pu', type: 'hiragana'),
    KanaCharacter(character: 'ぺ', romaji: 'pe', type: 'hiragana'),
    KanaCharacter(character: 'ぽ', romaji: 'po', type: 'hiragana'),

    KanaCharacter(character: 'きゃ', romaji: 'kya', type: 'hiragana'),
    KanaCharacter(character: 'きゅ', romaji: 'kyu', type: 'hiragana'),
    KanaCharacter(character: 'きょ', romaji: 'kyo', type: 'hiragana'),

    KanaCharacter(character: 'しゃ', romaji: 'sha', type: 'hiragana'),
    KanaCharacter(character: 'しゅ', romaji: 'shu', type: 'hiragana'),
    KanaCharacter(character: 'しょ', romaji: 'sho', type: 'hiragana'),

    KanaCharacter(character: 'ちゃ', romaji: 'cha', type: 'hiragana'),
    KanaCharacter(character: 'ちゅ', romaji: 'chu', type: 'hiragana'),
    KanaCharacter(character: 'ちょ', romaji: 'cho', type: 'hiragana'),

    KanaCharacter(character: 'にゃ', romaji: 'nya', type: 'hiragana'),
    KanaCharacter(character: 'にゅ', romaji: 'nyu', type: 'hiragana'),
    KanaCharacter(character: 'にょ', romaji: 'nyo', type: 'hiragana'),

    KanaCharacter(character: 'ひゃ', romaji: 'hya', type: 'hiragana'),
    KanaCharacter(character: 'ひゅ', romaji: 'hyu', type: 'hiragana'),
    KanaCharacter(character: 'ひょ', romaji: 'hyo', type: 'hiragana'),

    KanaCharacter(character: 'みゃ', romaji: 'mya', type: 'hiragana'),
    KanaCharacter(character: 'みゅ', romaji: 'myu', type: 'hiragana'),
    KanaCharacter(character: 'みょ', romaji: 'myo', type: 'hiragana'),

    KanaCharacter(character: 'りゃ', romaji: 'rya', type: 'hiragana'),
    KanaCharacter(character: 'りゅ', romaji: 'ryu', type: 'hiragana'),
    KanaCharacter(character: 'りょ', romaji: 'ryo', type: 'hiragana'),

    KanaCharacter(character: 'ぎゃ', romaji: 'gya', type: 'hiragana'),
    KanaCharacter(character: 'ぎゅ', romaji: 'gyu', type: 'hiragana'),
    KanaCharacter(character: 'ぎょ', romaji: 'gyo', type: 'hiragana'),

    KanaCharacter(character: 'じゃ', romaji: 'ja', type: 'hiragana'),
    KanaCharacter(character: 'じゅ', romaji: 'ju', type: 'hiragana'),
    KanaCharacter(character: 'じょ', romaji: 'jo', type: 'hiragana'),

    KanaCharacter(character: 'びゃ', romaji: 'bya', type: 'hiragana'),
    KanaCharacter(character: 'びゅ', romaji: 'byu', type: 'hiragana'),
    KanaCharacter(character: 'びょ', romaji: 'byo', type: 'hiragana'),

    KanaCharacter(character: 'ぴゃ', romaji: 'pya', type: 'hiragana'),
    KanaCharacter(character: 'ぴゅ', romaji: 'pyu', type: 'hiragana'),
    KanaCharacter(character: 'ぴょ', romaji: 'pyo', type: 'hiragana'),
  ];
}
