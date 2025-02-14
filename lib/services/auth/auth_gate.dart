import 'package:example_app/pages/home_page.dart';
import 'package:example_app/services/auth/login_or_register.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    // Listen to auth state changes using a StreamBuilder
    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        final session = Supabase.instance.client.auth.currentSession;

        if (session == null) {
          // If not logged in, show login or register page
          return const LoginOrRegister();
        } else {
          // If logged in, show the home page
          return const HomePage();
        }
      },
    );
  }
}
