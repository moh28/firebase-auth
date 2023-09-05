import 'package:flutter/material.dart';

class ChatEvents {}
class SendMessageEvent extends ChatEvents {
  final String?message;
  late TextEditingController sendMessageController;
  SendMessageEvent({this.message}) {
    sendMessageController = TextEditingController();
  }
}
class ReadMessageEvent extends ChatEvents {

}