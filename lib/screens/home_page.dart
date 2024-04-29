import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _numberController = TextEditingController();
  int _addedNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                key: const Key("textfield_number"),
                controller: _numberController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  _addNumber();
                },
                child: const Text("Add Number")
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                  _addedNumber.toString(),
                key: const Key("text_added_number"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _addNumber() {
    try {
      int newNumber = int.parse(_numberController.text);
      _addedNumber += newNumber;
      setState(() {});
    } on FormatException catch (e) {}
  }

}
