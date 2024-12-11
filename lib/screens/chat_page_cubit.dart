//ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:chatapp/constant/constant.dart';
import 'package:chatapp/cubit/chat_cubit/chat_cubit.dart';
import 'package:chatapp/model/messages.dart';
import 'package:chatapp/widget/chat_buble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPageCubit extends StatelessWidget {
  ChatPageCubit({super.key});
  static String id = 'chatpage';

  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();
  List<Message> messagelist = [];
  @override
  Widget build(BuildContext context) {
   var email = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 50,
            ),
            Text('Chat')
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatSuccess) {
                  messagelist = state.messages;
                }
              },
              builder: (context, state) {
                return ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagelist.length,
                    itemBuilder: (context, i) {
                      return messagelist[i].id == email
                          ? ChatBuble(
                              mesge: messagelist[i],
                            )
                          : ChatBubleFriend(mesge: messagelist[i]);
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: controller,
              onSubmitted: (value) {
                BlocProvider.of<ChatCubit>(context).
                sendMessage(mesage: value, email:email);
                controller.clear();
                _controller.animateTo(0,
                    //_controller.position.maxScrollExtent,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              decoration: InputDecoration(
                  hintText: 'Send Message',
                  suffixIcon: Icon(
                    Icons.send,
                    color: kPrimaryColor,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
          )
        ],
      ),
    );
  }
}



// //ignore_for_file: prefer_const_constructors, must_be_immutable

// import 'package:chatapp/constant/constant.dart';
// import 'package:chatapp/cubit/chat_cubit/chat_cubit.dart';
// import 'package:chatapp/model/messages.dart';
// import 'package:chatapp/widget/chat_buble.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ChatPageCubit extends StatelessWidget {
//   ChatPageCubit({Key? key});

//   static String id = 'chatpage';

//   final TextEditingController controller = TextEditingController();
//   final ScrollController _controller = ScrollController();
// List<Message> messagelist = [];
//   @override
//   Widget build(BuildContext context) {
//     final String? email = ModalRoute.of(context)?.settings.arguments.toString();

//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: kPrimaryColor,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               kLogo,
//               height: 50,
//             ),
//             Text('Chat')
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: BlocConsumer<ChatCubit, ChatState>(
//               listener: (context, state) {
//                 if (state is ChatSuccess) {
//                   // Update messagelist with the new list of messages
//                   messagelist = state.messages.toList();
//                 }
//               },
//               builder: (context, state) {
//                 return ListView.builder(
//                   reverse: true,
//                   controller: _controller,
//                   itemCount: messagelist.length,
//                   itemBuilder: (context, i) {
//                     return messagelist[i].id == email
//                         ? ChatBuble(
//                             mesge: messagelist[i],
//                           )
//                         : ChatBubleFriend(mesge: messagelist[i]);
//                   },
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: TextField(
//               controller: controller,
//               onSubmitted: (value) {
//                 BlocProvider.of<ChatCubit>(context).sendMessage(
//                   mesage: value,
//                   email: email!,
//                 );
//                 controller.clear();
//                 _controller.animateTo(
//                   0,
//                   duration: Duration(milliseconds: 500),
//                   curve: Curves.easeIn,
//                 );
//               },
//               decoration: InputDecoration(
//                 hintText: 'Send Message',
//                 suffixIcon: Icon(
//                   Icons.send,
//                   color: kPrimaryColor,
//                 ),
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide(color: kPrimaryColor),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: kPrimaryColor),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }