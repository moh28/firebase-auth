import 'package:flutter/material.dart';

import 'item_avatar.dart';
class ItemChat extends StatelessWidget {
  final int chat;
  final String?avatar;
  final String?message;
  final String?time;
  const ItemChat({Key? key, required this.chat, this.avatar, this.message, this.time}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment:
      chat == 2 ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        chat==2?Text('$time',style: TextStyle(color: Colors.grey.shade400),):Container(),
        chat==1?ItemAvatar(
          image: avatar,
          size: 50,
        ):Container(),
        Flexible(
          child: Container(
            margin: const EdgeInsetsDirectional.only(end: 10, start: 10, top: 20),
            padding:  const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: chat == 1 ? Colors.blue.shade50:Colors.blueGrey.shade100,
              borderRadius: chat == 1
                  ?  const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )
                  :  const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Text('$message'),
          ),
        ),
        chat ==1
            ? Text(
          '$time',
          style: TextStyle(color: Colors.grey.shade400),
        )
            : const SizedBox(),
      ],
    );
  }
}
