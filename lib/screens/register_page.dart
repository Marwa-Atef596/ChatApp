// // ignore_for_file: must_be_immutable, avoid_print, use_build_context_synchronously

// import 'package:chatapp/constant/constant.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// import '../helper/show_snack_bar.dart';
// import '../widget/custom_button.dart';
// import '../widget/custom_text_field.dart';
// import 'chat_page.dart';

// class RegisterPage extends StatefulWidget {
//   RegisterPage({super.key});
//   static String id = 'registerPage';
//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   //خاصه بالكلاس مش اوبجكت
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
//                       'REGISTER',
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
//                         await registerUser();
//                         Navigator.pushNamed(context, ChatPage.id,
//                             arguments: email);
//                       } on FirebaseAuthException catch (e) {
//                         if (e.code == 'weak-password') {
//                           showSnackBar(
//                               context, 'The password provided is too weak.');
//                         } else if (e.code == 'email-already-in-use') {
//                           showSnackBar(context,
//                               'The account already exists for that email.');
//                         }
//                       }
//                       isLoading = false;
//                       setState(() {});
//                     }
//                   },
//                   name: 'Register',
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text('already have an account ? ',
//                         style: TextStyle(color: Colors.white)),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Text(
//                         'Login',
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

//   Future<void> registerUser() async {
//     UserCredential userCredential = await FirebaseAuth.instance
//         .createUserWithEmailAndPassword(email: email!, password: pass!);
//     print(userCredential.user!.displayName);
//   }
// }
