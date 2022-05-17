import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_app/layout/cubit/cubit.dart';
import 'package:project_app/layout/cubit/states.dart';
import 'package:project_app/models/user/hyah_user.dart';
import 'package:project_app/modules/login_screen/hyah_login_screen.dart';
import 'package:project_app/modules/register/cubit/state.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:project_app/modules/settings_screen/settings_screen.dart';
import 'package:project_app/shared/components/components.dart';
import 'package:project_app/shared/network/local/cache_helper.dart';





class HyahRegisterCubit extends Cubit<HyahRegisterStates> {
  HyahRegisterCubit() : super(HyahRegisterInitialState());

  BuildContext get context => null;

  static HyahRegisterCubit get(context) => BlocProvider.of(context);

  //========================= signOut  and  resetPassword  ===================================

  void signOut(context) {
    emit(HyahSignOutLoadingState());
    FirebaseAuth.instance.signOut().then((value) async {
      CacheHelper.removeData(key: 'uId');
      await FirebaseFirestore.instance.collection('users').get().then((value) {
        value.docs.forEach((element) async {
          if (element.id == uId)
            element.reference.update({'token': null});
        });
      });
      navigateAndFinish(context, HyahLoginScreen());
      emit(HyahSignOutSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HyahSignOutErrorState());
    });
  }


  void resetPassword({
    @required String email,
  })
  {
    emit(HyahResetPasswordLoadingStates());
    FirebaseAuth.instance.sendPasswordResetEmail(
      email: email,
    ).then((value) {
      emit(HyahResetPasswordSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HyahResetPasswordErrorState());
    });
  }
  //====================================================================





  //====================================================================

  void userRegister({
    @required String name,
    @required String email,
    @required String password,
    @required String phone,
    @required String coverImage,
    @required String dateBirth,
    @required String cardId,
    @required String address,
    @required String gender,
    @required String imageCardID,
    String drivingLicenseImage,
    int confirmationOfInjury,
  }) {

    emit(HyahRegisterLoadingState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value)
        {
          userCreate(
              name: name,
              email: email,
              phone: phone,
              coverImage:coverImage ,
              dateBirth:dateBirth ,
              cardId:cardId ,
              address: address,
              gender: gender,
              imageCardID: imageCardID,
              uId: value.user.uid,
              drivingLicenseImage: null,
              confirmationOfInjury:confirmationOfInjury
          );
        }).catchError((error){
      emit(HyahRegisterErrorState(error.toString()));
    });
  }



  Future<void> userCreate({
    @required String name,
    @required String email,
    @required String phone,
    @required String coverImage,
    @required String address,
    @required String cardId,
    @required String dateBirth,
    @required String gender,
    @required String uId,
    @required String imageCardID,
     String drivingLicenseImage,
    int confirmationOfInjury,
  } ) async {
    HyahUserModel model = HyahUserModel(
      name: name,
      email: email,
      phone: phone,
      coverImage: 'https://image.freepik.com/free-photo/wooden-table-product-background_53876-92793.jpg',
      uId: uId,
      cardId: cardId,
      city: address,
      dateBirth: dateBirth,
      gender: gender,
      image: 'https://image.flaticon.com/icons/png/512/1251/1251263.png',
      imageCardID: imageCardID,
      drivingLicenseImage: drivingLicenseImage,
      theVaccineVerify: "false",
      confirmationOfInjury: 0,

    );


    FirebaseFirestore.instance.
    collection('users').doc(uId).
    set(model.toMap()).
    then((value) {
      emit(HyahCreateUserSuccessState());
    })
        .catchError((erroe) {
      emit(HyahCreateUserErrorState(erroe.toString()));
    });



  }

  var picker = ImagePicker();

  String urlImage ;
  Future<void>  uploadIdCardImage() async
  {
    emit(HyahLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(imageCardId.path).pathSegments.last}')
        .putFile(imageCardId)
        .then((value)
    {
       value.ref.getDownloadURL().then((value) async {
        emit(HyahUploadIdCardImageSuccessState());
          urlImage = await value;
        print(value);
      }).catchError((error) {
        emit(HyahUploadIdCardImageErrorState());
      });
    }).catchError((error) {
      emit(HyahUploadIdCardImageErrorState());
    });


  }

  String urlDrivingLicense ;
  Future<void>  uploadDrivingLicenseImage(context) async
  {
    emit(HyahLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(imageDrivingLicense.path).pathSegments.last}')
        .putFile(imageDrivingLicense)
        .then((value)
    {
      value.ref.getDownloadURL().then((value) async {
        emit(HyahUploadDrivingLicenseImageSuccessState());

        HyahCubit.get(context).updateDrivingLicenseImage(
          DrivingLicenseImage:  await value,
        );
        urlDrivingLicense = await value;
        print(value);
      }).catchError((error) {
        emit(HyahUploadDrivingLicenseImageErrorState());
      });
    }).catchError((error) {
      emit(HyahUploadDrivingLicenseImageErrorState());
    });


  }


  String urlVaccineImage ;
  Future<void>  uploadVaccineImage(context) async
  {

    emit(HyahVaccineImageLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(imageVaccine.path).pathSegments.last}')
        .putFile(imageVaccine)
        .then((value)
    {
      value.ref.getDownloadURL().then((value) async {
        emit(HyahUploadVaccineImageSuccessState());
        HyahCubit.get(context).updateVaccineImage(
          vaccineImage: await value,
        );
        urlVaccineImage = await value;
        print(value);
      }).catchError((error) {
        emit(HyahUploadVaccineImageErrorState());
      });
    }).catchError((error) {
      emit(HyahUploadVaccineImageErrorState());
    });


  }




  File imageCardId; // import dart.io
  Future<void> getCardIdImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.camera, imageQuality: 20,
    );

    if (pickedFile != null) {
      imageCardId = File(pickedFile.path);
      emit(HyahIdCardImagePickedSuccessState());
    } else {
      print(' No ImageID Selected ^_^ ');
      emit(HyahIdCardImagePickedErrorState());
    }
  }

  File imageDrivingLicense ;
  Future<void> getDrivingLicenseImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.camera, imageQuality: 20 ,
    );

    if (pickedFile != null) {
      imageDrivingLicense = File(pickedFile.path);
      emit(HyahDrivingLicenseImagePickedSuccessState());
    } else {
      print(' No ImageID Selected ^_^ ');
      emit(HyahDrivingLicenseImagePickedErrorState());
    }
  }

  File imageVaccine ;
  Future<void> getVaccineImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.camera, imageQuality: 20 ,
    );

    if (pickedFile != null) {
      imageVaccine = await File(pickedFile.path);
      emit(HyahVaccineImagePickedSuccessState());
    } else {
      print(' No ImageID Selected ^_^ ');
      emit(HyahVaccineImagePickedErrorState());
    }
  }





  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off;

    emit(HyahRegisterChangePasswordVisibilityStates());
  }


  bool isPasswordEightCharacters = false;
  bool hasPasswordOneNumber = false;
  bool hasPasswordOneCharacter = false;

  void onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    final alphanumeric  = RegExp(r'[A-Z]');
    emit(onPasswordChangedState());

    hasPasswordOneCharacter = false;
    if(alphanumeric.hasMatch(password))
      hasPasswordOneCharacter = true;

    hasPasswordOneNumber = false;
    if(numericRegex.hasMatch(password))
      hasPasswordOneNumber = true;

    isPasswordEightCharacters = false;
    if(password.length >= 8)
      isPasswordEightCharacters = true;

    emit(onPasswordChangedState());
  }


}







