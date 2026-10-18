import 'package:flutter_test/flutter_test.dart';
import 'package:moji/core/utils/greeting_util.dart';

void main() {
  group('GreetingUtil Unit Tests', () {
    test('getGreeting menghasilkan string sapaan yang valid', () {
      final greeting = GreetingUtil.getGreeting();
      
      expect(greeting, isNotEmpty);
      expect(
        greeting == 'Ohayou gozaimasu' ||
        greeting == 'Konnichiwa' ||
        greeting == 'Konbanwa',
        isTrue,
      );
    });
  });
}