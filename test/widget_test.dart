import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moji/main.dart'; // Pastikan nama package 'moji' sesuai dengan pubspec.yaml

void main() {
  testWidgets('MojiApp smoke test', (WidgetTester tester) async {

    await tester.pumpWidget(
      const ProviderScope(
        child: MojiApp(),
      ),
    );

    expect(find.text('Moji'), findsWidgets);
  });
}