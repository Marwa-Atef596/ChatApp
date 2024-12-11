import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future<void> loginUser({required String email, required String pass}) async {
    emit(LoginLoading());
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      emit(LoginSuccess());

      // ignore: unused_catch_clause
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(
            LoginFailure(errMessage: 'Wrong password provided for that user.'));
      }
    } catch (e) {
      emit(LoginFailure(errMessage: 'something went wrong'));
    }
  }
}
