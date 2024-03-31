import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {

  final String name;
  final String email;
  const ProfileSection({
    super.key,
    required this.name,
    required this.email
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0.1, 0.1),
                blurRadius: 2,
                spreadRadius: 0.2,
                color: Colors.grey
            )
          ]
      ),
      child: Row(
        children: [
          const Icon(Icons.person, size: 32,),
          const SizedBox(width: 16,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,

                  ),
                ),
                Text(
                  email,
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                  ),
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit, color: Colors.blue, size: 20,),
          )
        ],
      ),
    );
  }
}
