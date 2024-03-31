import 'package:flutter/material.dart';

class ButtonTapSection extends StatefulWidget {
  const ButtonTapSection({super.key});

  @override
  State<ButtonTapSection> createState() => _ButtonTapSectionState();
}

class _ButtonTapSectionState extends State<ButtonTapSection> {

  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          child: Text("Tambahkan!"),
          onPressed: () {
            _counter++;
            setState(() {
            });
          },
        ),
        const SizedBox(height: 16,),
        GestureDetector(
            child: Text("$_counter")
        )
      ],
    );
  }
}
