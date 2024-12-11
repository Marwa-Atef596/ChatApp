import 'package:chatapp/model/messages.dart';
import 'package:flutter/material.dart';

import '../constant/constant.dart';

class ChatBuble extends StatelessWidget {
  ChatBuble({
    super.key,
    required this.mesge,
  });
  final Message mesge;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(bottom: 32, right: 32, top: 32, left: 16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
            )),
        child: Text(
          mesge.message,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}

class ChatBubleFriend extends StatelessWidget {
  ChatBubleFriend({
    super.key,
    required this.mesge,
  });
  final Message mesge;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(bottom: 32, right: 32, top: 32, left: 16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: Color(0xff006D84),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            )),
        child: Text(
          mesge.message,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
