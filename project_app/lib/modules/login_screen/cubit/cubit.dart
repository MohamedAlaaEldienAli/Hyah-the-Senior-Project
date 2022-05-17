


import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app/modules/login_screen/cubit/states.dart';



class HyahLoginCubit extends Cubit <HyahLoginStates>
{


  HyahLoginCubit() :  super(HyahLoginInitialState());

  static HyahLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    @required String email,
    @required String password,
  })
  {
    emit(HyahLoginLoadingState()); // by3ml emit 3kbal mygeb data

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value) {

      print(value.user.email);
      print(value.user.uid);
      emit(HyahLoginSuccessState(
          'تسجيل ناجح , مرحبا بعودتك '
          ,value.user.uid));
    }).catchError((error){
      emit(HyahLoginErrorState(
         'الرجاء التاكد من البريد الألكتروني أو الرقم السري'
      ));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true ;

  void changePasswordVisibility()
  {
    isPassword = ! isPassword ;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off;

    emit( HyahChangePasswordVisabilityState ());
  }
}

