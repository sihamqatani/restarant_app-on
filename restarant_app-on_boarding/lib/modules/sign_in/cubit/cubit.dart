import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restarant_app/modules/sign_in/cubit/states.dart';

class SignInCubit extends Cubit<RestarantSignInStates> {
  SignInCubit() : super(RestarantSignInIntialState());
  static SignInCubit get(context) => BlocProvider.of(context);
  void userLogin({required String email, required String password}) {
    emit(RestarantSignInLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(' hello Mrs/Miss....${value.user?.email}');
      emit(RestarantSignInSuccessState(uId: value.user!.uid));
    }).catchError((onError) {
      print(RestarantSignInErrorState(error: onError.toString()));
    });
  }

  void changePassword({required String email}) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) {
      emit(ChangePasswordSuess());
      print('is changed');
    }).catchError((onError) {
      emit(ChangrPasswordError(error: onError.toString()));
      print('is failed');
    });
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
    emit(SignOutState());
  }
 
 
}
