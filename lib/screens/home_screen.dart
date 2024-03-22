import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _controllerNama = TextEditingController();
  String _nama = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controllerNama,
              decoration: InputDecoration(
                hintText: "Masukkan nama",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.red, width: 2)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.red, width: 2)
                ),
                filled: true,
                fillColor: Colors.grey
              ),
            ),
            MaterialButton(
                child: const Text("Click Me!"),
                onPressed: () {
                  _nama = _controllerNama.text;
                  setState(() {});
                }
            ),
            Text(_nama)
          ],
        ),
      ),
    );
  }
}
