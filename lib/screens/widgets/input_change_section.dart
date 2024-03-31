import 'package:flutter/material.dart';

class InputChangeSection extends StatefulWidget {
  const InputChangeSection({super.key});

  @override
  State<InputChangeSection> createState() => _InputChangeSectionState();
}

class _InputChangeSectionState extends State<InputChangeSection> {

  String _input = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (newInput) {
            _input = newInput;
            setState(() {
            });
          },
        ),
        const SizedBox(height: 16,),
        Text(_input)
      ],
    );
  }
}
