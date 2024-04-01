import 'package:flutter/material.dart';
import 'package:hello_world/screens/second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String dataReceived = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text("HOME PAGE"),
            const SizedBox(height: 16,),
            MaterialButton(
                color: Colors.blue,
                onPressed: () async {
                  dataReceived = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => SecondPage(
                            username: "mark_steward",
                            email: "mark@tech.so",
                          )
                      )
                  );

                  setState(() {
                  });
                },
                child: const Text("GO TO SECOND PAGE")
            ),
            const SizedBox(height: 16,),
            Text("DATA DITERIMA: $dataReceived"),
          ],
        ),
      ),
    );
  }
}
