
import 'package:flutter/material.dart';

class PostModel{
  String uId ;
  String name;
  String image;
  String dataTime;
  String text;
  String postImage;

  PostModel({
    this.uId,
    this.name,
    this.image,
    this.text,
    this.dataTime,
    this.postImage,
  });

  PostModel.fromJson(Map<String ,dynamic > json)
  {
    name = json['name'];
    uId = json['uId'];
    image = json['image'];
    text = json['text'];
    dataTime = json['dataTime'];
    postImage = json['postImage'];

  }

  Map<String ,dynamic > toMap()
  {
    return {
      'name':name,
      'uId':uId,
      'image':image,
      'text':text,
      'dataTime':dataTime,
      'postImage':postImage,
    };
  }

}