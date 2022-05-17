

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
import 'package:project_app/modules/register/cubit/cubit.dart';
import 'package:project_app/modules/settings_screen/settings_screen.dart';
import 'package:project_app/shared/components/components.dart';


class EditProfileScreen extends StatelessWidget {






  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HyahRegisterCubit(),
      child: BlocConsumer < HyahCubit ,HyahStates>(
        listener: (context , state ) async {
          if (state is HyahUploadProfileImageSuccessState)
          {
            navigateAndFinish(context, HomeHyahScreen());
          }
          if (state is HyahUploadCoverImageSuccessState)
          {
            Navigator.pop(context);

          }


        },
        builder: (context , state )
        {
          var userModel = HyahCubit.get(context).userModel;
          var profileImage = HyahCubit.get(context).profileImage;
          var coverImage = HyahCubit.get(context).coverImage;
          var nameController = TextEditingController();

          nameController.text = userModel.name;

          return Scaffold(
            backgroundColor: HexColor('f1f1f1'),
            appBar: defaultAppBar(
              onPressed: (){
                navigateAndFinish(context, HomeHyahScreen());
              },
              context: context,
              title: 'تعديل الملف الشخصي',

              actions:
              [
                if (profileImage != null && coverImage == null)
                defaultTextButton(
                  function: ()
                  async {

                       HyahCubit.get(context).uploadProfileImage();

                  },

                  text: 'حفظ',
                ),
                if (coverImage != null && profileImage == null)
                  defaultTextButton(
                    function: ()
                    async {

                      HyahCubit.get(context).uploadCoverImage();

                    },

                    text: 'حفظ',
                  ),

                SizedBox(width: 15,)
              ],
            ),
            body: Container(

              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children:
                    [
                      if ( state is HyahUserUpdateLoadingState )
                        LinearProgressIndicator(),
                      if ( state is HyahUserUpdateLoadingState )
                      SizedBox(height: 10,),
                      Container(
                        height: 200,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children:
                          [
                            Align(
                              alignment: AlignmentDirectional.topCenter,
                              child: Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  Container(
                                    height: 160,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),

                                      image: DecorationImage(
                                        image: coverImage == null ? NetworkImage(
                                            '${userModel.coverImage}'
                                        ) : FileImage(coverImage),
                                        fit: BoxFit.cover,

                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor:HexColor('#0A81AB'),
                                      child: IconButton(
                                          onPressed: ()
                                          {
                                            HyahCubit.get(context).getCoverImage();
                                          },
                                          icon: Icon(Iconsax.gallery_edit,color: HexColor('#f1f1f1'),),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                CircleAvatar(
                                  radius: 54,
                                  backgroundColor: HexColor('#f1f1f1'),
                                  child: CircleAvatar(
                                    radius:50,
                                    backgroundImage: profileImage == null ? NetworkImage(
                                      '${userModel.image}',
                                    ) : FileImage(profileImage),
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 14,
                                  backgroundColor: HexColor('#0A81AB'),
                                  child: IconButton(
                                    onPressed: ()
                                    {
                                      HyahCubit.get(context).getProfileImage();
                                    },
                                    icon: Icon(Iconsax.camera,size: 14, color: HexColor('#f1f1f1'),),
                                  ),
                                ),


                              ],
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 25,),

                        Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [


                            SizedBox(width: 20,),

                          ],
                        ),
                      ),

                        SizedBox(height: 45,),
                      //=====================================

                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                nameSheet(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.person_pin_outlined,color: Colors.black ,size: 22,),
                                        SizedBox(width: 10,),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            'تعديل الأسم',
                                            style:TextStyle(color: Colors.black ,fontSize: 17),
                                          ),
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
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 300,
                            child: Image.asset('assets/images/Winter.png',
                              fit: BoxFit.cover ,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void nameSheet(context) {
    var userModel = HyahCubit.get(context).userModel;
    var nameController = TextEditingController();

    var formKey = GlobalKey<FormState>();




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
                            Icon(Icons.person_pin_outlined,color: Theme.of(context).textTheme.caption.color),
                            SizedBox(
                              width: 15,
                            ),
                            Text('الاسم الحالي :' ,style: Theme.of(context).textTheme.caption,)
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(''),
                          SizedBox(width:40),
                          Container(
                              alignment: Alignment.topRight,
                              child: Text('${userModel.name}', style: Theme.of(context).textTheme.bodyText2,)),
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
                                        validate: (value) {
                                          if (value.isEmpty) {
                                            return ' الرجاء كتابه الأسم كما هوا موضح في البطاقه ';
                                          }

                                        },
                                        controller: nameController,
                                        type: TextInputType.text,
                                        label: 'الأسم الجديد',
                                        prefix: Icons.account_circle_outlined,

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
                            name: nameController.text,

                          );
                          await Future.delayed(Duration(seconds: 1));
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              content: Text(
                                'تم تحديث الأسم بنجاح',
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
