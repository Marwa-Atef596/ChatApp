import 'package:chatapp/constant/constant.dart';

class Message {
  final String message;
  final String id;

  Message(this.message, this.id);
  factory Message.fromjson(json) {
    return Message(json[kMessage], json['id']);
  }
}
