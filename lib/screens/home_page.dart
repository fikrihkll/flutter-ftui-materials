import 'package:flutter/material.dart';
import 'package:hello_world/screens/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text("HOME PAGE"),
            const SizedBox(height: 16,),
            MaterialButton(
              child: Text("Go To Second Page"),
              color: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(
                    context,
                    secondPage,
                    arguments: "steward@gmail.com"
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
