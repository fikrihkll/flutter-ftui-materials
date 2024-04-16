import 'package:flutter/material.dart';
import 'package:hello_world/screens/setting_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
                child: const Text("OPEN SETTING"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => SettingPage()));
                }
            )
          ],
        ),
      ),
    );
  }
}
