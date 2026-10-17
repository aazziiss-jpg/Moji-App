import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MojiApp(),
    ),
  );
}

class MojiApp extends StatelessWidget {
  const MojiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moji',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE53935),
          brightness: Brightness.light,
        ),
      ),
      home: const Scaffold(
        body: Center(
          child: Text('Moji - Aplikasi Belajar Huruf Jepang'),
        ),
      ),
    );
  }
}