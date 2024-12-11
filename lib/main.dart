// import 'package:chatapp/screens/chat_page.dart';
// import 'package:chatapp/screens/login_page.dart';
// import 'package:chatapp/screens/register_page.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// import 'firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       routes: {
//         'LoginPage': (context) => LoginPage(),
//         RegisterPage.id: (context) => RegisterPage(),
//         ChatPage.id: (context) => ChatPage()
//       },
//       initialRoute: 'LoginPage',
//     );
//   }
// }

import 'package:chatapp/cubit/chat_cubit/chat_cubit.dart';
import 'package:chatapp/cubit/login_cubit/login_cubit.dart';
import 'package:chatapp/cubit/register_cubit/register_cubit.dart';
import 'package:chatapp/screens/chat_page_cubit.dart';
import 'package:chatapp/screens/login_page_cubit.dart';
import 'package:chatapp/screens/registerpage_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[BlocProvider(
        create: (context) => LoginCubit(),
      ) ,
      BlocProvider(
        create: (context) => RegisterCubit(),
      ) ,
       BlocProvider(
        create: (context) => ChatCubit(),
      ) 

       ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'LoginPage': (context) => LoginPageCubit(),
          RegisterPageCubit.id: (context) => RegisterPageCubit(),
          ChatPageCubit.id: (context) => ChatPageCubit()
        },
        initialRoute: 'LoginPage',
      ),
    );
  }
}
