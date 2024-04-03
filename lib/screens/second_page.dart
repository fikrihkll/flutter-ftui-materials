import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {

  final String username;
  const SecondPage({
    super.key,
    required this.username
  });

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text("SECOND PAGE!"),
            const SizedBox(height: 16,),
            Text("USERNAME DATA: ${widget.username}")
          ],
        ),
      ),
    );
  }
}
