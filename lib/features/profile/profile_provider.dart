import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final profileNameProvider = FutureProvider<String>((ref) async {
  final user = Supabase.instance.client.auth.currentUser;
  if (user == null) return 'Pelajar';

  final response = await Supabase.instance.client
      .from('profiles')
      .select('full_name')
      .eq('id', user.id)
      .maybeSingle();

  return (response?['full_name'] as String?) ?? 'Pelajar';
});