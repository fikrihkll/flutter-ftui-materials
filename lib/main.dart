import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HelloWorldApp(),
    );
  }
}


class HelloWorldApp extends StatelessWidget {
  const HelloWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Tulisan dengan Font Default"),
              const SizedBox(height: 16,),
              const Text(
                "Tulisan dengan Font OpenSans weight 300",
                style: TextStyle(
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.w300
                ),
              ),
              const Text(
                "Tulisan dengan Font OpenSans weight 500",
                style: TextStyle(
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 16,),
              Image.asset("assets/images/lake_garda.png"),
              const SizedBox(height: 16,),
              Image.asset("assets/logo/logo_example.png"),
            ],
          ),
        ),
      ),
    );
  }
}
