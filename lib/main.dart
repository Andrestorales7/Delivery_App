import 'package:example_app/models/restaurant.dart';
import 'package:example_app/services/auth/auth_gate.dart';
import 'package:example_app/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



void main() async {
  //supabase setup
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://iqvitaisevukxklpgton.supabase.co", 
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imlxdml0YWlzZXZ1a3hrbHBndG9uIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzkxMDgxOTAsImV4cCI6MjA1NDY4NDE5MH0.aSqOUH3B9TNv5Eltw2EQdXiWIoA0bvpdMyeL6xDAxjg");
  
  
  runApp(
    
    MultiProvider(
      providers: [
        //theme provider
        ChangeNotifierProvider(
        create: (contex) => ThemeProvider()),

        //restaurante provider
        ChangeNotifierProvider(
        create: (contex) => Restaurant()),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
     
    );
  
  }
}

