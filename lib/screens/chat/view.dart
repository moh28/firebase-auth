
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dimo/screens/chat/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import '../../core/colors.dart';
import 'bloc/events.dart';
import 'bloc/model.dart';
import 'component/item_chat.dart';
class ChatPage extends StatefulWidget {
  const ChatPage({super.key, });
  @override
  ChatPageState createState() => ChatPageState();
}
class ChatPageState extends State<ChatPage> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('messages').snapshots();
  final bloc = KiwiContainer().resolve<ChatBloc>();
  final event = SendMessageEvent();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: const Icon(Icons.arrow_back),

        title: const Text( 'widget.data?.firstName'),
      ),
      body:  StreamBuilder(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData) {
            List<MessagesModel>messageModel=[];
            for(int i =0;i<snapshot.data.docs.length;i++){
              messageModel.add(MessagesModel.fromJson(snapshot.data.docs[i]));
            }
          return  ListView.builder(
          reverse: false,
          padding: const EdgeInsets.only(bottom: 150),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {return  ItemChat(
            chat: 1,
            message:messageModel[index].message,
            time: '18.00',
          );  },
          itemCount:messageModel.length,
        );
        }else{
            return const SizedBox();
          } },
      ),

      floatingActionButton:  Container(
        height: 120,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        color: Colors.white,
        child: TextField(
          onSubmitted: (value){
            bloc.add(SendMessageEvent(message: value));
            event.sendMessageController.clear();
          },
          controller: event.sendMessageController,
          decoration: InputDecoration(
            hintText:"write your message here",
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
