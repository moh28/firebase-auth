
import 'package:flutter/material.dart';
import '../../core/colors.dart';
import 'component/item_chat.dart';
class ChatPage extends StatefulWidget {
  const ChatPage({super.key, });
  @override
  ChatPageState createState() => ChatPageState();
}
class ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: const Icon(Icons.arrow_back),

        title: const Text( 'widget.data?.firstName'),
      ),
      body:  ListView.builder(
              reverse: true,
              padding: const EdgeInsets.only(bottom: 150),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {return const ItemChat(
                chat: 1,
                message:':bloc.allMessage[index].messageText,',
                time: '18.00',
              );  },
              itemCount:19,
            ),

      floatingActionButton:  Container(
        height: 120,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        color: Colors.white,
        child: TextField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            hintText:"write your message here",
            suffixIcon: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: primaryColor),
              padding: const EdgeInsets.all(14),
              child: GestureDetector(
                onTap: (){

                },
                child: const Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.all(20),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: primaryColor),
              borderRadius: BorderRadius.circular(25),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: primaryColor),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
// 2 = Send
// 1 = Received
}
