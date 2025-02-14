import 'package:flutter/material.dart';
import 'package:example_app/components/message_display.dart';
import 'package:example_app/components/my_button.dart';
import 'package:example_app/components/my_textfield.dart';
import 'package:example_app/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  String? errorMessage;
  String? successMessage;

  // Sign Up Method
  Future<void> signUp() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      setState(() {
        errorMessage = "Las contraseñas no coinciden";
      });
      return;
    }

    try {
      await _authService.signUpWithEmailPassword(email, password);
    
      setState(() {
        errorMessage = null;
        successMessage = "Cuenta creada con éxito"; // Show success message
      });
    } catch (error) {
      setState(() {
        successMessage = null;
        errorMessage = error.toString(); // Show error message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Restaurant Name
            Text(
              "The Black Dog",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25),

            // Delivery Truck Icon (instead of an image)
            Icon(
              Icons.food_bank_rounded, // Delivery truck icon
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25),

            // App Slogan
            Text(
              "Crear una Cuenta",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25),

            // Email TextField
            MyTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),
            const SizedBox(height: 10),

            // Password TextField
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 10),

            // Confirm Password TextField
            MyTextField(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              obscureText: true,
            ),
            const SizedBox(height: 10),

            // Display error or success message
            MessageDisplay(message: errorMessage, isSuccess: false),
            MessageDisplay(message: successMessage, isSuccess: true),

            // Register Button
            MyButton(
              text: "Registrarse",
              onTap: signUp,
            ),
            const SizedBox(height: 10),

            // Already have an account? Login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "¿Ya tienes una cuenta?",
                  style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Inicia Sesión",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
