// // ignore_for_file: prefer_const_constructors, must_be_immutable

// import 'package:chatapp/constant/constant.dart';
// import 'package:chatapp/model/messages.dart';
// import 'package:chatapp/widget/chat_buble.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ChatPage extends StatelessWidget {
//   ChatPage({super.key});
//   static String id = 'chatpage';
//   CollectionReference message =
//       FirebaseFirestore.instance.collection(kMessageController);
//   TextEditingController controller = TextEditingController();
//   final _controller = ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     var emil = ModalRoute.of(context)!.settings.arguments;
//     return StreamBuilder<QuerySnapshot>(
//         //هتجبلى مل الدوكيومنتيشن
//         stream: message.orderBy(kCreatedAt, descending: true).snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             // print(snapshot.data!.docs[0]['message']);
//             List<Message> messagelist = [];
//             for (int i = 0; i < snapshot.data!.docs.length; i++) {
//               messagelist.add(Message.fromjson(snapshot.data!.docs[i]));
//             }
//             return Scaffold(
//               appBar: AppBar(
//                 automaticallyImplyLeading: false,
//                 backgroundColor: kPrimaryColor,
//                 title: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       kLogo,
//                       height: 50,
//                     ),
//                     Text('Chat')
//                   ],
//                 ),
//               ),
//               body: Column(
//                 children: [
//                   Expanded(
//                     child: ListView.builder(
//                         reverse: true,
//                         controller: _controller,
//                         itemCount: messagelist.length,
//                         itemBuilder: (context, i) {
//                           return messagelist[i].id == emil
//                               ? ChatBuble(
//                                   mesge: messagelist[i],
//                                 )
//                               : ChatBubleFriend(mesge: messagelist[i]);
//                         }),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: TextField(
//                       controller: controller,
//                       onSubmitted: (value) {
//                         message.add({
//                           kMessage: value,
//                           kCreatedAt: DateTime.now(),
//                           'id': emil
//                         });
//                         controller.clear();
//                         _controller.animateTo(0,
//                             //_controller.position.maxScrollExtent,
//                             duration: Duration(milliseconds: 500),
//                             curve: Curves.easeIn);
//                       },
//                       decoration: InputDecoration(
//                           hintText: 'Send Message',
//                           suffixIcon: Icon(
//                             Icons.send,
//                             color: kPrimaryColor,
//                           ),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(color: kPrimaryColor),
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: kPrimaryColor),
//                             borderRadius: BorderRadius.circular(16),
//                           )),
//                     ),
//                   )
//                 ],
//               ),
//             );
//           }
//           return Scaffold(
//             body: Text("Loading...."),
//           );
//         });
//   }
// }
