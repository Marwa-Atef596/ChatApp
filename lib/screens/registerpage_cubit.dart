// ignore_for_file: must_be_immutable, avoid_print, use_build_context_synchronously

import 'package:chatapp/constant/constant.dart';
import 'package:chatapp/cubit/register_cubit/register_cubit.dart';
import 'package:chatapp/screens/chat_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snack_bar.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';

class RegisterPageCubit extends StatelessWidget {
  //خاصه بالكلاس مش اوبجكت
  String? email;
  static String id = 'registerPage';

  String? pass;

  bool isLoading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          Navigator.pushNamed(context, ChatPageCubit.id);
          isLoading = false;

        } else if (state is RegisterFailure) {
          showSnackBar(context, state.errMessage);
          isLoading = false;

        }
      },
      builder: (context, state) {
        return Scaffold(
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
                          'REGISTER',
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
                      ontap: () async {
                        if (formkey.currentState!.validate()) {
                          BlocProvider.of<RegisterCubit>(context)
                              .registerUser(email: email!, pass: pass!);
                        }
                      },
                      name: 'Register',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('already have an account ? ',
                            style: TextStyle(color: Colors.white)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Login',
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
        );
      },
    );
  }
}
