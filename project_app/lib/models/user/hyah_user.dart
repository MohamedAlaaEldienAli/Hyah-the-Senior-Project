
import 'dart:io';

import 'package:flutter/material.dart';

class HyahUserModel{
   String uId ;
   String name;
   String email;
   String phone;
   String image;
   String coverImage;
   String imageCardID;
   String drivingLicenseImage;
   String vaccineImage;
   String cardId;
   String dateBirth;
   String gender;
   String city;
   String theVaccineVerify;
   int confirmationOfInjury;

  HyahUserModel({
     this.uId,
     this.name,
     this.email,
     this.phone,
     this.image,
    this.coverImage,
     this.imageCardID,
    this.drivingLicenseImage,
    this.vaccineImage,
     this.cardId,
     this.dateBirth,
     this.gender,
     this.city,
    this.confirmationOfInjury,

     this.theVaccineVerify,
  });

  HyahUserModel.fromJson(Map<String ,dynamic > json)
  {
    name = json['name'];
    email = json['email'];
    uId = json['uId'];
    phone = json['phone'];
    image = json['image'];
    coverImage = json['coverImage'];
    imageCardID = json['imageCardID'];
    drivingLicenseImage = json['drivingLicenseImage'];
    vaccineImage = json['vaccineImage'];
    cardId = json['cardId'];
    dateBirth = json['dateBirth'];
    gender = json['gender'];
    city = json['city'];
    confirmationOfInjury = json['confirmationOfInjury'];

    theVaccineVerify = json['theVaccineVerify'];

  }

   Map<String ,dynamic > toMap()
   {
     return {
       'name':name,
       'email':email,
       'phone':phone,
       'uId':uId,
       'image':image,
       'coverImage':coverImage,
       'imageCardID':imageCardID,
       'drivingLicenseImage':drivingLicenseImage,
       'vaccineImage':vaccineImage,
       'cardId':cardId,
       'dateBirth':dateBirth,
       'gender':gender,
       'city':city,
       'theVaccineVerify':theVaccineVerify,
       'confirmationOfInjury':confirmationOfInjury,
     };
   }

}