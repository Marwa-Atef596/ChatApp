// // ignore_for_file: must_be_immutable, use_build_context_synchronously

// import 'package:chatapp/constant/constant.dart';
// import 'package:chatapp/screens/chat_page.dart';
// import 'package:chatapp/screens/register_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// import '../helper/show_snack_bar.dart';
// import '../widget/custom_button.dart';
// import '../widget/custom_text_field.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   String? email;

//   String? pass;

//   bool isLoading = false;

//   GlobalKey<FormState> formkey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kPrimaryColor,
//       body: ModalProgressHUD(
//         inAsyncCall: isLoading,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8),
//           child: Form(
//             key: formkey,
//             child: Column(
//               children: [
//                 const Spacer(
//                   flex: 2,
//                 ),
//                 Image.asset(kLogo),
//                 const Text(
//                   'Scholar Chat',
//                   style: TextStyle(
//                       fontFamily: 'Pacifico',
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//                 const Spacer(
//                   flex: 1,
//                 ),
//                 const Row(
//                   children: [
//                     Text(
//                       'LOGIN',
//                       style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 CustomTextField(
//                   onchanged: (valu) {
//                     email = valu;
//                   },
//                   hintText: 'Email',
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 CustomTextField(
//                   obsecure: true,
//                   onchanged: (valu) {
//                     pass = valu;
//                   },
//                   hintText: 'Password',
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 CustomButton(
//                   ontap: () async {
//                     if (formkey.currentState!.validate()) {
//                       isLoading = true;
//                       setState(() {});
//                       try {
//                         await loginUser();
//                         Navigator.pushNamed(context, ChatPage.id,arguments: email);
//                       } on FirebaseAuthException catch (e) {
//                         if (e.code == 'user-not-found') {
//                           showSnackBar(
//                               context, 'No user found for that email.');
//                         } else if (e.code == 'wrong-password') {
//                           showSnackBar(context,
//                               'Wrong password provided for that user.');
//                         }
//                       }
//                       isLoading = false;
//                       setState(() {});
//                     }
//                   },
//                   name: 'Login',
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text('don\'t have an account ? ',
//                         style: TextStyle(color: Colors.white)),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(context, RegisterPage.id);
//                       },
//                       child: const Text(
//                         'Register',
//                         style: TextStyle(
//                             color: Color(0xffC7EDE6),
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Spacer(
//                   flex: 3,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> loginUser() async {
//     UserCredential userCredential = await FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email!, password: pass!);
//     print(userCredential.user!.displayName);
//   }
// }
