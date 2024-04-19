import 'package:flutter/material.dart';
import 'package:hello_world/models/remote/user_response.dart';

class UserDetailWidget extends StatelessWidget {

  final UserResponse entity;
  const UserDetailWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
