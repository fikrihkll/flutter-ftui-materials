import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late String apiKey;
  late String messageEnv;

  @override
  void initState() {
    apiKey = const String.fromEnvironment("api_key", defaultValue: "");
    messageEnv = const String.fromEnvironment("message", defaultValue: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("API KEY: $apiKey"),
          Text("MESSAGE: $messageEnv")
        ],
      ),
    );
  }
}
