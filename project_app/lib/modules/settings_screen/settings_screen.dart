import 'dart:ui';


import 'package:animated_button/animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:project_app/layout/cubit/cubit.dart';
import 'package:project_app/layout/cubit/home.dart';
import 'package:project_app/layout/cubit/states.dart';
import 'package:project_app/modules/edit_profile/edit_profile_screen.dart';
import 'package:project_app/modules/login_screen/hyah_login_screen.dart';
import 'package:project_app/modules/register/cubit/cubit.dart';
import 'package:project_app/modules/register/cubit/state.dart';
import 'package:project_app/shared/components/components.dart';
import 'package:project_app/shared/cubit/cubit.dart';
import 'package:project_app/shared/network/local/cache_helper.dart';




class SettingsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) =>
          HyahRegisterCubit(),
      child: BlocConsumer<HyahCubit, HyahStates>(

        listener: (context, state) async {

        },
        builder: (context, state) {
          var userModel = HyahCubit.get(context).userModel;
          var profileImage = HyahCubit.get(context).profileImage;


          var phoneController = TextEditingController();
          var formKey = GlobalKey<FormState>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Column(
                      children: [


                        Container(
                          height: 190,
                          child: Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              //عملتها futureBuilder  عشان احل مشكله صوره الكفر ال بترجع بقيمه null
                              FutureBuilder(
                                  builder: (context, state) {
                                return Align(
                                  alignment: AlignmentDirectional.topCenter,
                                  child: Stack(
                                    alignment: AlignmentDirectional.topEnd,
                                    children: [
                                      Container(
                                        height: 170,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          image: DecorationImage(
                                            image:NetworkImage(
                                                '${userModel.coverImage}'
                                            ) ,
                                            fit: BoxFit.cover,

                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                );
                              }),
                              Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  CircleAvatar(
                                    radius: 54,
                                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                    child: CircleAvatar(
                                      radius:50,
                                      backgroundImage:  NetworkImage(
                                        '${userModel.image}',
                                      ) ,
                                    ),
                                  ),

                                ],
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          '${userModel.name}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        if ( state is HyahUserUpdateLoadingState )
                          Container(
                            width: 350,
                            child: LinearProgressIndicator(
                              color: Colors.red,
                              backgroundColor:HexColor('#5DACA5') ,
                            ),
                          ),

                      ],
                    ),

                    OutlinedButton(
                        onPressed: (){
                      navigateTo(context, EditProfileScreen());
                    },
                        child: Text('تـعـديـل' ,style: TextStyle( color:HexColor('#0A81AB'),),)),
                      SizedBox(height: 35,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                 phoneNumsheet(context);
                                  },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.phone_android_outlined,color: Theme.of(context).textTheme.bodyText2.color ,size: 22,),
                                        SizedBox(width: 10,),
                                        Text(
                                          'تحديث رقم الهاتف',
                                          style: Theme.of(context).textTheme.bodyText2,
                                        ),
                                      ],
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            color:HexColor('#0A81AB'),
                                            borderRadius: BorderRadius.all(Radius.circular(7))
                                        ),

                                        child: Icon(Icons.arrow_drop_down_sharp ,color: Colors.white,size: 22,)
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () async {
                                  HyahRegisterCubit.get(context).resetPassword(email: userModel.email);
                                  await Future.delayed(Duration(seconds: 1));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        ' سيتم أرسال رابط تغيير كلمه المرور على بريدك الالكتروني',
                                        style: TextStyle(fontSize: 16,color: Colors.black),
                                      ),
                                      backgroundColor: Colors.amber,
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.lock_outline ,color: Theme.of(context).textTheme.bodyText2.color ,size: 22,),
                                        SizedBox(width: 10,),
                                        Text(
                                          'تغير كلمه المرور',
                                          style: Theme.of(context).textTheme.bodyText2,
                                        ),
                                      ],
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            color:HexColor('#0A81AB'),
                                            borderRadius: BorderRadius.all(Radius.circular(7))
                                        ),

                                        child: Icon(Icons.arrow_drop_down_sharp ,color: Colors.white,size: 22,)
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {

                                  AppCubit.get(context).changeAppMode();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.brightness_4_outlined,color: Theme.of(context).textTheme.bodyText2.color ,size: 22,),
                                        SizedBox(width: 10,),
                                        Text(
                                          'تغير ثـيـم التطبيق',
                                          style: Theme.of(context).textTheme.bodyText2,
                                        ),
                                      ],
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            color:HexColor('#0A81AB'),
                                            borderRadius: BorderRadius.all(Radius.circular(7))
                                        ),

                                        child: Icon(Icons.arrow_drop_down_sharp ,color: Colors.white,size: 22,)
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {

                                  HyahRegisterCubit.get(context).signOut(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.logout ,color: Theme.of(context).textTheme.bodyText2.color ,size: 22,),
                                        SizedBox(width: 10,),
                                        Text(
                                          'تسجيل الخروج',
                                          style: Theme.of(context).textTheme.bodyText2,
                                        ),
                                      ],
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            color:HexColor('#0A81AB'),
                                            borderRadius: BorderRadius.all(Radius.circular(7))
                                        ),

                                        child: Icon(Icons.arrow_drop_down_sharp ,color: Colors.white,size: 22,)
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void phoneNumsheet(context) {
    var userModel = HyahCubit.get(context).userModel;
    var phoneController = TextEditingController();
    //phoneController.text = userModel.phone;
    var formKey = GlobalKey<FormState>();
    var state =true;



    showMaterialModalBottomSheet(
      barrierColor: HexColor('#0A81AB').withOpacity(0.5),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SingleChildScrollView(
          child: Container(
            height: 330,
            decoration: BoxDecoration(
              color: HexColor('#dee2e6'),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Icon(Icons.phone_android_outlined,color: Theme.of(context).textTheme.bodyText2.color),
                            SizedBox(
                              width: 15,
                            ),
                            Text('رقم الهاتف الحالي')
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(''),
                          SizedBox(width:40),
                          Container(
                              alignment: Alignment.topRight,
                              child: Text('${userModel.phone}', style: TextStyle(),)),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Form(
                              key: formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Container(
                                      child: defaultFormField(
                                        maxLength: 11,
                                        validate: (value) {
                                          if (value.isEmpty) {
                                            return ' الرجاء أدخاال رقم الهاتف';
                                          }
                                          else if (value.length != 11) {
                                            return ' الرجاء ادخال الرقم بشكل صحيح';
                                          }
                                        },
                                        controller: phoneController,
                                        type: TextInputType.number,
                                        label: 'رقم الهاتف الجديد',
                                        prefix: Icons.local_phone_outlined,

                                      ),
                                      height: 60,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),

                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],

                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedButton(
                      height: 45,
                      width: 140,
                      color: HexColor('#0A81AB'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'تحديث',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 8),

                        ],
                      ),
                      onPressed: ()
                      async {

                        if (formKey.currentState.validate()) {
                          HyahCubit.get(context).updateUser(
                            phone: phoneController.text,
                          );
                          await Future.delayed(Duration(seconds: 1));
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              content: Text(
                                'تم تحديث الرقم بنجاح',
                                style: TextStyle(fontSize: 16),
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                    ),
                    AnimatedButton(
                        height: 45,
                        width: 140,
                        color: HexColor('#9d0208'),
                        child: Text(
                          'إلغاء',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: ()
                        {

                          Navigator.pop(context);

                        }

                    ),


                  ],
                ),
              ],

            ),
          ),
        ),
      ),
    );
  }


}
