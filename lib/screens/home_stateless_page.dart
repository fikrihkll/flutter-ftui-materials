import 'package:flutter/material.dart';

class HomeStatelessPage extends StatelessWidget {
  const HomeStatelessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Widget Example'),
      ),
      body: Center(
        child: Text(
          'Hello, World!',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
