import 'package:flutter/material.dart';

class ChatEvents {}
class SendMessageEvent extends ChatEvents {
  late TextEditingController sendMessageController;
  SendMessageEvent() {
    sendMessageController = TextEditingController();
  }
}