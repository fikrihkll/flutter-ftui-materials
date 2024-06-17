import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/screens/edit_message_page.dart';
import 'package:hello_world/screens/model/message.dart';
import 'package:hello_world/screens/service/message_service.dart';
import 'package:hello_world/screens/widget/message_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final MessageService _messageService = MessageService();

  final TextEditingController _messageController = TextEditingController();
  List<Message> _messageList = [];

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
                    return MessageCardWidget(
                        onDeleteClick: (message) {
                          _showDeleteConfirmationDialog(message);
                        },
                        onCardClick: (message) {
                          _launchEditMessagePage(message);
                        },
                        message: _messageList[position]
                    );
                  }
              )
            ],
          ),
        )
      ),
    );
  }

  void _launchEditMessagePage(Message message) async {
    var newMessage = await Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => EditMessagePage(message: message))
    );

    if (newMessage != null && newMessage is Message) {
      var index = _messageList.indexWhere((element) => element.id == message.id);
      _messageList[index] = newMessage;
      setState(() {
      });
      _showPopUp("Berhasil Mengubah Pesan");
    } else {
      _showPopUp("Gagal Mengubah Pesan");
    }
  }

  void _sendMessage() async {
    String newMessage = _messageController.text;
    var result = await _messageService.sendMessage(newMessage);
    if (result == true) {
      _getMessage();
      _showPopUp("Berhasil Menambahkan Pesan");
    } else {
      _showPopUp("Gagal Menambahkan Pesan");
    }
  }

  void _deleteMessage(Message message) async {
    var result = await _messageService.deleteMessage(message.id);
    if (result == true) {
      _messageList.remove(message);
      setState(() {
      });
      _showPopUp("Berhasil Menghapus Pesan");
    } else {
      _showPopUp("Gagal Menghapus Pesan");
    }
  }

  void _showDeleteConfirmationDialog(Message message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Hapus Pesan?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            content: const Text("Pesan tidak dapat dirollback setelah terhapus, yakin ingin menghapus?"),
            actions: [
              TextButton(onPressed: () {
                Navigator.pop(context);
              }, child: const Text("Batalkan", style: TextStyle(color: Colors.red),)),
              TextButton(
                  onPressed: () {
                    _deleteMessage(message);
                    Navigator.pop(context);
                  },
                  child: const Text("Ya")
              )
            ],
          );
        });
  }

  void _getMessage() async {
    List<Message> messageList = await _messageService.getMessage();
    _messageList = messageList;
    setState(() {
    });
  }

    void _showPopUp(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

}
