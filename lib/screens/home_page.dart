import 'package:flutter/material.dart';
import 'package:hello_world/screens/widgets/button_tap_section.dart';
import 'package:hello_world/screens/widgets/gesture_detector_section.dart';
import 'package:hello_world/screens/widgets/input_change_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ButtonTapSection(),
            InputChangeSection(),
            GestureDetectorSection()
          ],
        ),
      ),
    );
  }
}
