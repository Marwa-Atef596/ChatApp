import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../constant/constant.dart';
import '../../model/messages.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference message =
      FirebaseFirestore.instance.collection(kMessageController);

  void sendMessage({required String mesage, required String email}) {
    try {
      //loading
      message.add({kMessage: mesage, kCreatedAt: DateTime.now(), 'id': email});
    } catch (e) {
      // TODO
      //failure
    }
  }

  void getMessage() {
    message.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      List<Message> messageslist = [];
      print(event.docs);
      messageslist.clear();
      for (var doc in event.docs) {
        print(doc);
        messageslist.add(Message.fromjson(doc));
      }
      print("success");
      emit(ChatSuccess(messages: messageslist));
    });
  }
}
