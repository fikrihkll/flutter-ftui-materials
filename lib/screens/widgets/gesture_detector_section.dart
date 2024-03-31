import 'package:flutter/material.dart';

class GestureDetectorSection extends StatefulWidget {
  const GestureDetectorSection({super.key});

  @override
  State<GestureDetectorSection> createState() => _GestureDetectorSectionState();
}

class _GestureDetectorSectionState extends State<GestureDetectorSection> {

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              _counter ++;
              setState(() {
              });
            },
            child: Text("Hii this is Text that can be clicked!")
        ),
        const SizedBox(height: 16,),
        Text("$_counter")
      ],
    );
  }
}
