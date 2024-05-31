import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/screens/model/message.dart';

class MessageService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> sendMessage(String newMessage) async {
    var chatReference = _firestore.collection("chat");
    String uniqueId = chatReference.doc().id;

    Map<String, dynamic> newDocument = {
      "id": uniqueId,
      "message": newMessage,
      "timestamp": FieldValue.serverTimestamp()
    };

    try {
      await chatReference.doc(uniqueId).set(newDocument);
      return true;
    } catch (e) {
      debugPrint("ERROR: ${e}");
      return false;
    }
  }

  Future<bool> editMessage(String id, String newMessage) async {
    var chatReference = _firestore.collection("chat");

    Map<String, dynamic> document = {
      "message": newMessage,
      "timestamp": FieldValue.serverTimestamp()
    };

    try {
      await chatReference.doc(id).update(document);
      return true;
    } catch (e) {
      debugPrint("ERROR: ${e}");
      return false;
    }
  }

  Future<bool> deleteMessage(String id) async {
    var chatReference = _firestore.collection("chat");
    try {
      await chatReference.doc(id).delete();
      return true;
    } catch (e) {
      debugPrint("ERROR: ${e}");
      return false;
    }
  }

  Future<List<Message>> getMessage() async {
    try {
      var documentList = await _firestore
        .collection("chat")
        .get();

      List<Message> messageList = [];
      for (var document in documentList.docs) {
        messageList.add(
          Message(
              id: document.get("id"),
              message: document.get("message"),
              timestamp: (document.get("timestamp") as Timestamp).toDate()
          )
        );
      }
      return messageList;
    } catch (e) {
      debugPrint("ERROR: ${e}");
      return [];
    }
  }
}