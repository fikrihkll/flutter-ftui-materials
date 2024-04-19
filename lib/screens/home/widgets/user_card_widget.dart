import 'package:flutter/material.dart';
import 'package:hello_world/models/remote/user_response.dart';

class UserCardWidget extends StatelessWidget {

  final Function(UserResponse entity) onCardClicked;
  final UserResponse entity;
  const UserCardWidget({
    super.key,
    required this.entity,
    required this.onCardClicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCardClicked(entity);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade300, offset: const Offset(0.6, 0.5), blurRadius: 4.5)
            ]
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text(entity.username)),
                Text("ID: ${entity.id}")
              ],
            ),
            Text("Email: ${entity.email}"),
            const SizedBox(height: 8,),
            Text("Company: ${entity.company.name} - ${entity.company.catchPhrase}")
          ],
        ),
      ),
    );
  }

}
