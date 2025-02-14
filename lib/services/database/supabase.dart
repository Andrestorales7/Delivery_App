import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart'; // Import for debugPrint

class SupabaseService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<void> saveOrderToDatabase(String receipt) async {
    try {
      await supabase.from('orders').insert({
        'date': DateTime.now().toIso8601String(),
        'order': receipt,
      });

      debugPrint('✅ Order saved successfully!');
    } catch (e) {
      debugPrint('❌ Error saving order: $e');
    }
  }
}
