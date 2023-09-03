
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dimo/screens/chat/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'events.dart';
class ChatBloc extends Bloc<ChatEvents, ChatStates> {
  ChatBloc() : super((InitialChatStates())) {
    on<SendMessageEvent>(_postSignUp);
  }
  CollectionReference message = FirebaseFirestore.instance.collection('messages');
  Future< void> _postSignUp(
      SendMessageEvent event, Emitter<ChatStates> emit) async {
    emit(LoadingChatState());

    await message.add({
     "message":event.sendMessageController.text
  }).then((value) {
    emit(SuccessSendMessageState());
   }).catchError((error) {
     emit(FailedSendMessageState());});
}}