import 'package:flutter/material.dart';

class MenuSetting extends StatelessWidget {

  final String title;
  final String description;
  final IconData icon;
  const MenuSetting({
    super.key,
    required this.title,
    required this.description,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 16,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(thickness: 0.6,)
        ),
      ],
    );
  }
}