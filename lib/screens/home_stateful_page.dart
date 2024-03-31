import 'package:flutter/material.dart';

class HomeStatefulPage extends StatefulWidget {
  const HomeStatefulPage({super.key});

  @override
  State<HomeStatefulPage> createState() => _HomeStatefulPageState();
}

class _HomeStatefulPageState extends State<HomeStatefulPage> {
  int _counter = 0;
  void _incrementCounter() {
    _counter++;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter:',
            ),
            Text(
              '$_counter',
              style: const TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
