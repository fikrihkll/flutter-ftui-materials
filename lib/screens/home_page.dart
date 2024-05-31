import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Counter: ${_counter}"),
          MaterialButton(
            child: const Text("Count"),
              onPressed: () {
                setState(() {
                  _counter++;
                });
              }
          )
        ],
      ),
    );
  }
}
