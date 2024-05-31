import 'package:flutter/material.dart';
import 'package:hello_world/screens/model/message.dart';
import 'package:hello_world/screens/service/message_service.dart';

class EditMessagePage extends StatefulWidget {
  final Message message;
  const EditMessagePage({super.key, required this.message});

  @override
  State<EditMessagePage> createState() => _EditMessagePageState();
}

class _EditMessagePageState extends State<EditMessagePage> {

  final MessageService _messageService = MessageService();
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    _messageController.text = widget.message.message;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Message ID: ${widget.message.id}"),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(hintText: "Ketik pesan..."),
            ),
            MaterialButton(
                child: Text("Edit Pesan"),
                color: Colors.blue,
                onPressed: () {
                  _editMessage();
                }
            ),
          ],
        ),
      ),
    );
  }

  void _editMessage() async {
    String messageId = widget.message.id;
    String newMessage = _messageController.text;
    var result = await _messageService.editMessage(messageId, newMessage);
    if (!mounted) return;
    if (result == true) {
      // Back to previous thing with new message
      Navigator.pop(context, Message(id: widget.message.id, message: newMessage, timestamp: DateTime.now()));
    } else {
      // Back to previous thing with null value
      Navigator.pop(context, null);
    }
  }

}
