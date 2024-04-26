import 'package:flutter/material.dart';

class MessageCardWidget extends StatelessWidget {

  final String message;
  const MessageCardWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade600.withOpacity(0.3),
              blurRadius: 3.0,
              offset: const Offset(0.3, 0.7)
          )
        ]
      ),
      child: Text(message),
    );
  }
}
