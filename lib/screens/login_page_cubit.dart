// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:chatapp/constant/constant.dart';
import 'package:chatapp/cubit/chat_cubit/chat_cubit.dart';
import 'package:chatapp/cubit/login_cubit/login_cubit.dart';
import 'package:chatapp/screens/chat_page_cubit.dart';
import 'package:chatapp/screens/registerpage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../helper/show_snack_bar.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';

class LoginPageCubit extends StatelessWidget {
  static String id = 'login page';
  String? email;

  String? pass;

  bool isLoading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    //BlocListener not change ui
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatCubit>(context).getMessage();
          Navigator.pushNamed(context, ChatPageCubit.id,arguments: email);
          isLoading = false;
        } else if (state is LoginFailure) {
          showSnackBar(context, state.errMessage);
          isLoading = false;
        }
      },
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Image.asset(kLogo),
                  const Text(
                    'Scholar Chat',
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const Row(
                    children: [
                      Text(
                        'LOGIN',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    onchanged: (valu) {
                      email = valu;
                    },
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    obsecure: true,
                    onchanged: (valu) {
                      pass = valu;
                    },
                    hintText: 'Password',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    ontap: () {
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context)
                            .loginUser(email: email!, pass: pass!);
                      } else {}
                    },
                    name: 'Login',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('don\'t have an account ? ',
                          style: TextStyle(color: Colors.white)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterPageCubit.id);
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              color: Color(0xffC7EDE6),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
