import 'package:flutter/material.dart';
import 'package:hello_world/screens/model/message.dart';

class MessageCardWidget extends StatelessWidget {

  final Message message;
  final Function(Message) onDeleteClick;
  final Function(Message) onCardClick;
  const MessageCardWidget({
    super.key,
    required this.message,
    required this.onDeleteClick,
    required this.onCardClick
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCardClick(message);
      },
      child: Container(
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
        child: Column(
          children: [
            Text(message.message),
            IconButton(
              onPressed: () {
                onDeleteClick(message);
              }, icon: const Icon(Icons.delete, color: Colors.red,)
            )
          ],
        ),
      ),
    );
  }
}
