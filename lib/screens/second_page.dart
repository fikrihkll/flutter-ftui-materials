import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {

  final String username;
  final String email;
  const SecondPage({
    super.key,
    required this.username,
    required this.email
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
            const Text("SECOND PAGE"),
            const SizedBox(height: 16,),
            MaterialButton(
                child: Text("BACK TO HOME PAGE"),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pop(context, "Data dari Second Page");
                }
            ),
            const SizedBox(height: 16,),
            const Text("Data dari HomePage"),
            Text("USERNAME: ${widget.username}"),
            Text("EMAIL: ${widget.email}"),
          ],
        ),
      ),
    );
  }
}
