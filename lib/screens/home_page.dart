import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/screens/widget/message_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _messageController = TextEditingController();
  List<String> _messageList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _messageController,
                decoration: InputDecoration(hintText: "Ketik pesan..."),
              ),
              MaterialButton(
                  child: Text("Kirim Pesan"),
                  color: Colors.blue,
                  onPressed: () {
                    _sendMessage();
                  }
              ),
              const SizedBox(height: 32,),
              MaterialButton(
                  child: Text("Dapatkan Pesan Dari Server"),
                  color: Colors.blue,
                  onPressed: () {
                    _getMessage();
                  }
              ),
              ListView.builder(
                  itemCount: _messageList.length,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    return MessageCardWidget(message: _messageList[position]);
                  }
              )
            ],
          ),
        )
      ),
    );
  }

  void _sendMessage() {
    String newMessage = _messageController.text;
    Map<String, dynamic> newDocument = {
      "message": newMessage
    };

    _firestore.collection("chat")
      .add(newDocument)
      .then((value) {
        _showPopUp("Berhasil kirim pesan");
      })
      .catchError((error) {
        _showPopUp("Error: $error");
      });
  }

  void _getMessage() {
    _firestore
      .collection("chat")
      .get()
      .then((value) {
        value.docs.forEach((element) {
          _messageList.add(element.get("message"));
          setState(() {
          });
        });
      })
      .catchError((error) {
        _showPopUp("Error Mengambil Data: $error");
      });
  }

  void _showPopUp(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

}
