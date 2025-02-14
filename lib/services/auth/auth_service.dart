import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Sign in with email and password
  Future<String?> signInWithEmailPassword(String email, String password) async {
    try {
      final AuthResponse res = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (res.user == null) {
        return "Login failed. Please check your credentials.";
      }

      return null; // No error, login successful
    } on AuthException catch (e) {
      return e.message; // Return Supabase error message
    } catch (e) {
      return "An unknown error occurred.";
    }
  }

  // Sign up with email and password
  Future<String?> signUpWithEmailPassword(String email, String password) async {
    try {
      final AuthResponse res = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      if (res.user == null) {
        return "Sign-up failed. Please try again.";
      }

      return null; // No error, sign-up successful
    } on AuthException catch (e) {
      return e.message; // Return Supabase error message
    } catch (e) {
      return "An unknown error occurred.";
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
}
