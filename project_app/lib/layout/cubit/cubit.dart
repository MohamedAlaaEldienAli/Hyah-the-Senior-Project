import 'dart:io';


import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:intl/intl.dart';
import 'package:project_app/layout/cubit/states.dart';
import 'package:project_app/models/message/message_model.dart';
import 'package:project_app/models/posts/post_model.dart';
import 'package:project_app/models/user/hyah_user.dart';
import 'package:project_app/modules/control_panal_out/control_out.dart';
import 'package:project_app/modules/feeds/feeds_screen.dart';
import 'package:project_app/modules/register/cubit/cubit.dart';
import 'package:project_app/modules/services/services_screen.dart';
import 'package:project_app/modules/settings_screen/settings_screen.dart';
import 'package:project_app/shared/components/components.dart';
import 'package:project_app/shared/network/local/cache_helper.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class HyahCubit extends Cubit<HyahStates> {
  HyahCubit() : super(HyahInitialStates());

  get user => null;



  static HyahCubit get(context) => BlocProvider.of(context);

  HyahUserModel userModel;






  String dateTime;
  void dateUpdate()
  {
    emit(HyahUserUpdateDateState());
    var now = new DateTime.now();
    var formatter = new DateFormat.yMMMMd('ar').add_jm();
    String formattedDate = formatter.format(now);
    dateTime = formattedDate;
    // print(formattedDate);
    // print(userModel.cardId);



  }




  void getUserData() async {
    emit(HyahGetUserLoadingStates());
     await FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) async {
       value.data();
      userModel = HyahUserModel.fromJson(value.data());
      emit(HyahGetUserSuccessStates());
    }).catchError((error) {
      emit(HyahGetUserErrorStates(error.toString()));
    });
  }


  int currentIndex = 0;

  List<Widget> screens = [
    FeedsScreen(),
    ServicesScreen(),
    ControlPanelOutScreen(),
    SettingsScreen(),
  ];

  List<String> titles = [
    'Home',
    'Services',
    'Control Panel',
    'Profile',
  ];

  void changeBottomNav(int index) {

      currentIndex = index;
      emit(HyahChangeBottomNavState());

  }



//===================  للتعامل مع الصور =================



  File profileImage; // import dart.io

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(HyahProfileImagePickedSuccessState());
    } else {
      print(' No Image Selected ^_^ ');
      emit(HyahProfileImagePickedErrorState());
    }
  }

  //===============================================================
  //========================= Cover Image ========================

  File coverImage; // import dart.io

  Future<void> getCoverImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(HyahCoverImagePickedSuccessState());
    } else {
      print(' No Image Selected ^_^ ');
      emit(HyahCoverImagePickedErrorState());
    }
  }

  // File imageCardID; // import dart.io
  var picker = ImagePicker();


//=================================================

//===================== لتحميل الصوره علي السيرقير ==========






  void uploadProfileImage({
    @required String name,
    @required String email,
    @required String phone,
    @required String CoverImage,
    @required String address,
    @required String cardId,
    @required String dateBirth,
    @required String gender,
    @required String uId,
    @required String imageCardID,
    String drivingLicenseImage,
    int confirmationOfInjury,
  }) {
    emit(HyahUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage.path).pathSegments.last}')
        .putFile(profileImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(HyahUploadProfileImageSuccessState());
        updateUser(
            image: value  ,
            DrivingLicenseImage: userModel.drivingLicenseImage,
            vaccineImage: userModel.vaccineImage,
            address: userModel.city,
            imageCardID: userModel.imageCardID,
            name: userModel.name,
            dateBirth: userModel.dateBirth,
            gender: userModel.gender,
            phone: userModel.phone,
            coverImage: userModel.coverImage,
            cardId: userModel.cardId,
            theVaccineVerify: userModel.theVaccineVerify,
            uId: userModel.uId,
            email: userModel.email,
            confirmationOfInjury: userModel.confirmationOfInjury
        );
        profileImage = null;
      }).catchError((error) {
        emit(HyahUploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(HyahUploadProfileImageErrorState());
    });
  }

  void uploadCoverImage({
    @required String name,
    @required String email,
    @required String phone,
    @required String CoverImage,
    @required String address,
    @required String cardId,
    @required String dateBirth,
    @required String gender,
    @required String uId,
    @required String imageCardID,
    String drivingLicenseImage,
    int confirmationOfInjury,
  }) {
    emit(HyahUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage.path).pathSegments.last}')
        .putFile(coverImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(HyahUploadCoverImageSuccessState());
        updateUser(
            DrivingLicenseImage: userModel.drivingLicenseImage,
            vaccineImage: userModel.vaccineImage,
            address: userModel.city,
            imageCardID: userModel.imageCardID,
            name: userModel.name,
            dateBirth: userModel.dateBirth,
            gender: userModel.gender,
            phone: userModel.phone,
            image: userModel.image ,
            coverImage: value ,
            cardId: userModel.cardId,
            theVaccineVerify: userModel.theVaccineVerify,
            uId: userModel.uId,
            email: userModel.email,
            confirmationOfInjury: userModel.confirmationOfInjury

        );

        coverImage =null;
      }).catchError((error) {
        emit(HyahUploadCoverImageErrorState());
      });
    }).catchError((error) {
      emit(HyahUploadCoverImageErrorState());
    });
  }

  //========================================

//============================


  void updateDrivingLicenseImage({

    @required String DrivingLicenseImage,


  }) {
    HyahUserModel model = HyahUserModel(
      drivingLicenseImage: DrivingLicenseImage,
      vaccineImage: userModel.vaccineImage,
      imageCardID: userModel.imageCardID,
      city: userModel.city,
      image: userModel.image,
      name: userModel.name,
      dateBirth: userModel.dateBirth,
      gender: userModel.gender,
      phone: userModel.phone,
      coverImage: userModel.coverImage,
      cardId: userModel.cardId,
        theVaccineVerify: userModel.theVaccineVerify,
      uId: userModel.uId,
      email: userModel.email,
      confirmationOfInjury: userModel.confirmationOfInjury

    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(HyahUserUpdateErrorState());
    });
  }

  void updateVaccineImage({

    @required String vaccineImage,


  }) {
    HyahUserModel model = HyahUserModel(
        vaccineImage: vaccineImage,
        drivingLicenseImage: userModel.drivingLicenseImage,
        imageCardID: userModel.imageCardID,
        city: userModel.city,
        name: userModel.name,
        dateBirth: userModel.dateBirth,
        gender: userModel.gender,
        phone: userModel.phone,
        coverImage: userModel.coverImage,
        image: userModel.image,
        cardId: userModel.cardId,
        theVaccineVerify: userModel.theVaccineVerify,
        uId: userModel.uId,
        email: userModel.email,
        confirmationOfInjury: userModel.confirmationOfInjury

    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(HyahUserUpdateErrorState());
    });
  }





  void updateUser({

    String name,
    String email,
    String phone,
    String address,
    String cardId,
    String image,
    String coverImage,
    String dateBirth,
    String gender,
    String uId,
    String imageCardID,
     String vaccineImage,
    String DrivingLicenseImage,
    String theVaccineVerify,
    int confirmationOfInjury

  }) {

    HyahUserModel model = HyahUserModel(
        vaccineImage: userModel.vaccineImage,
        drivingLicenseImage: userModel.drivingLicenseImage,
        imageCardID: userModel.imageCardID,
        city: userModel.city,
        name:name?? userModel.name,
        dateBirth: userModel.dateBirth,
        gender: userModel.gender,
        image: image ?? userModel.image,
        phone:  userModel.phone,
        coverImage: coverImage ?? userModel.coverImage,
        cardId: userModel.cardId,
        theVaccineVerify: userModel.theVaccineVerify,
        uId: userModel.uId,
        email: userModel.email,
        confirmationOfInjury: userModel.confirmationOfInjury

      // // image: 'https://image.flaticon.com/icons/png/512/1251/1251263.png',
      // imageCardID: imageCardID ?? userModel.imageCardID,
      // isEmailVerified: false,
    );
    emit(HyahUserUpdateSuccessState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      print(error);
      emit(HyahUserUpdateErrorState());
    });


  }








//==================================================




// =================================================



//===================================================

}


