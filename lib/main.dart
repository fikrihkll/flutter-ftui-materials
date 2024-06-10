import 'package:flutter/material.dart';
import 'package:hello_world/my_theme.dart';
import 'package:hello_world/screens/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      home: const LoginPage(),
    );
  }
}