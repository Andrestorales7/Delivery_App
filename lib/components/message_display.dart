import 'package:flutter/material.dart';

class MessageDisplay extends StatelessWidget {
  final String? message;
  final bool isSuccess; // True for success, false for error

  const MessageDisplay({
    super.key,
    required this.message,
    this.isSuccess = true,
  });

  @override
  Widget build(BuildContext context) {
    if (message == null) {
      return SizedBox.shrink(); // If there's no message, show nothing
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        message!,
        style: TextStyle(
          color: isSuccess ? Colors.green : Colors.red,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
