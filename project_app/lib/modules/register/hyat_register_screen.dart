import 'package:conditional_builder/conditional_builder.dart';
import 'package:date_format/date_format.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_app/modules/login_screen/hyah_login_screen.dart';
import 'package:project_app/modules/register/cubit/cubit.dart';
import 'package:project_app/shared/components/components.dart';

import 'cubit/state.dart';


class HyahRegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var emailCheckController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var genderController;

  var cardIdController = TextEditingController();
  var dateBirthController = TextEditingController();
  var addressController;

  String name;
  String Time;

  String cardId;

  String dateBirth;


  String email;

  String address;

  List<String> gender = [
    "Male",
    "Female",
  ];
  String selectGender = '';

  List<String> city = [
    "Giza",
    "Cairo",
    "Alexandria",
    "Asyut",
    "Beheira",
    "Beni Suef",
    "Faiyum",
    "Kafr El Sheikh",
    "Qena",
    "Suez",
  ];
  String selectCity = '';



  var formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HyahRegisterCubit(),
      child: BlocConsumer<HyahRegisterCubit, HyahRegisterStates>(
        listener: (context, state) {
          if (state is HyahCreateUserSuccessState) {
            navigateAndFinish(
              context,
              HyahRegisterForm2(),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Image.asset(
                'assets/images/logo_ligth.png',
                fit: BoxFit.cover,
                height: 220,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
              ),
              toolbarHeight: 80,
              automaticallyImplyLeading: false,
              backwardsCompatibility: false,
              backgroundColor: HexColor('#0A81AB'),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: HexColor('#0A81AB'),
                statusBarIconBrightness: Brightness.light,
              ),
              elevation: 5,
              actions: [
                InkWell(
                  onTap: () {
                    navigateAndFinish(context, HyahLoginScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            defaultFormField(
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return ' الرجاء ادخال الاسم';
                                }
                              },
                              controller: nameController,
                              type: TextInputType.name,
                              label: 'الأسم',
                              prefix: Iconsax.user,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return ' الرجاء أدخال الرقم القومي';
                                }
                                else if(value.length != 14)
                                {
                                  return 'الرقم اصغر من 14 رقم';
                                }
                              },
                              controller: cardIdController,
                              type: TextInputType.number,
                              label: 'الرقم القومي  ',
                              prefix: Iconsax.card_pos,
                              maxLength: 14,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return ' الرجاء ادخال البريد الاكتروني';
                                  }
                                },
                                controller: emailController,
                                type: TextInputType.emailAddress,
                                label: 'البريد الأكتروني',
                                prefix: Icons.alternate_email_outlined),
                            SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                                validate: (String value) {
                                  if (emailController.text !=
                                      emailCheckController.text) {
                                    return ("البريد الاكتروني غغير مطابق");
                                  } else if (value.isEmpty) {
                                    return ' الرجاء تأكيد البريد الأكتروني';
                                  }
                                },
                                controller: emailCheckController,
                                type: TextInputType.emailAddress,
                                label: 'تأكيد البريد الأكتروني',
                                prefix: Icons.alternate_email_outlined),
                            SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'الرجاء إدخال تاريخ الميلاد';
                                }
                              },
                              controller: dateBirthController,
                              type: TextInputType.datetime,
                              label: 'تـاريخ الميلاد ',
                              prefix: Iconsax.calendar_1,
                              onTap: () {
                                DatePicker.showDatePicker(
                                    context,
                                    showTitleActions: true,
                                    theme:DatePickerTheme(
                                      cancelStyle: TextStyle(fontSize: 22, color: Colors.red ),
                                      doneStyle: TextStyle(fontSize: 22 , color:  HexColor('#0A81AB')),
                                    ),

                                    minTime: DateTime(1960, 3, 5),
                                    maxTime: DateTime(2018, 6, 7),
                                    onConfirm: (date) {
                                  print(formatDate(
                                      date, [yyyy, '-', mm, '-', dd]));
                                  Time = formatDate(
                                      date, [yyyy, '-', mm, '-', dd]);
                                  dateBirthController.text = Time;
                                  print(Time);
                                },
                                    currentTime: DateTime(2015, 10, 13),
                                    locale: LocaleType.ar);
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            DropdownButtonFormField2(
                              decoration:InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),

                              ),
                              hint:  Row(
                                children: [
                                  Icon(Icons.wc_outlined),
                                  SizedBox(width: 15,),
                                  Text(
                                    'النوع',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                              icon:  Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30,
                              buttonHeight: 60,
                              buttonPadding:  EdgeInsets.only(left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),

                              items: gender
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.black)
                                        ),
                                      ))
                                  .toList(),
                              validator: (String value) {
                                if (value == null ) {
                                  return "الرجاء أختيار النوع";
                                }
                              },
                              onChanged: (value) {
                                selectGender = value
                                    .toString(); //Do something when changing the item if you want.
                                print(selectGender);
                                genderController = selectGender;

                                print(" gg= $selectGender");
                              },
                              onSaved: (value) {
                                selectGender = value.toString();
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            DropdownButtonFormField2(
                              decoration:InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),

                              ),
                              hint:  Row(
                                children: [
                                  Icon(Iconsax.home_1),
                                  SizedBox(width: 15,),
                                  Text(
                                    'المحافطة',
                                    style: TextStyle(fontSize: 17),
                                  ),

                                ],
                              ),
                              icon:  Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30,
                              buttonHeight: 60,
                              buttonPadding:  EdgeInsets.only(left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),

                              items: city
                                  .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                    item,
                                    style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.black)
                                ),
                              ))
                                  .toList(),
                              validator: ( value) {
                                if (value == null) {
                                  return "الرجاء أختيار المحافظة ";
                                }
                              },
                              onChanged: (value) {
                                selectCity = value
                                    .toString(); //Do something when changing the item if you want.
                                print(addressController);
                                addressController = selectCity;

                                print(" gg= $selectCity");
                              },
                              onSaved: (value) {
                                selectCity = value.toString();
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: defaultButton(
                                  function: () {
                                    if (formKey.currentState.validate()) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HyahRegisterForm2(
                                                    name: nameController.text,
                                                    email: emailController.text,
                                                    cardId: cardIdController.text,
                                                    address: addressController,
                                                    dateBirth: dateBirthController.text,
                                                    gender: genderController,
                                                  )));
                                    }
                                  },
                                  text: 'الـتالـي',
                                  isUpperCase: true,
                                  background: HexColor("#e17f61")),
                            ),
                          ],
                        ),
                      ),
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
}

class HyahRegisterForm2 extends StatelessWidget {
  final String name, cardId, dateBirth, gender, email, address;

  HyahRegisterForm2({
    this.email,
    this.name,
    this.cardId,
    this.dateBirth,
    this.gender,
    this.address,
  });

  var passwordController = TextEditingController();
  var phoneController = TextEditingController();





  var formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HyahRegisterCubit(),
      child: BlocConsumer<HyahRegisterCubit, HyahRegisterStates>(
        listener: (context, state) {
          if (state is HyahCreateUserSuccessState) {
            navigateAndFinish(
              context,
              HyahRegisterDone(),
            );
          }
        },
        builder: (context, state) {
          var idCardImage = HyahRegisterCubit.get(context).imageCardId;
          var urlImage = HyahRegisterCubit.get(context).urlImage;
          final numericRegex = RegExp(r'[0-9]');
          final alphanumeric  = RegExp(r'[A-Z]');


          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Image.asset(
                'assets/images/logo_ligth.png',
                fit: BoxFit.cover,
                height: 220,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
              ),
              toolbarHeight: 80,
              automaticallyImplyLeading: false,
              backwardsCompatibility: false,
              backgroundColor: HexColor('#0A81AB'),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: HexColor('#0A81AB'),
                statusBarIconBrightness: Brightness.light,
              ),
              elevation: 5,
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (idCardImage != null)
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 10,
                            margin: EdgeInsets.all(10),
                            child: Image(
                              image: idCardImage != null
                                  ? FileImage(idCardImage)
                                  : null,
                              fit: BoxFit.cover,
                              height: 180,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          defaultTextButton(
                            function: () {
                              HyahRegisterCubit.get(context)
                                  .getCardIdImage();
                            },

                            text: 'تصوير البطاقه الشخصيه',
                          ),
                          Icon(
                            Icons.add_a_photo_outlined,
                            color: HexColor('#0A81AB'),
                            size: 24,
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Column(
                        children: [
                          if (state is HyahLoadingState &&  idCardImage != null)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.white,
                                color: HexColor('#0A81AB'),
                              ),
                            ),

                          if (idCardImage != null)
                          OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            side: BorderSide(width:1, color: HexColor('#0A81AB')),
                          ),
                            child: Container(
                              width: 120,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('تحميل الصوره',style: TextStyle(color:  HexColor('#0A81AB'),),),
                                  SizedBox(width: 10,),
                                  Icon(
                                    Icons.cloud_upload_outlined,
                                    color: HexColor('#0A81AB'),
                                  ),
                                ],
                              ),
                            ),
                            onPressed:() {
                              HyahRegisterCubit.get(context)
                                       .uploadIdCardImage();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                const SnackBar(
                                content: Text(
                                'يتم الان تحميل الصوره الرجاء الأنتظار',
                                style: TextStyle(fontSize: 18),
                                ),
                                backgroundColor: Colors.deepOrange,
                                ),
                                );

                            },
                          ),
                          // if (urlImage == null)
                          // OutlinedButton(
                          // style: OutlinedButton.styleFrom(
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(7.0),
                          //   ),
                          //   side: BorderSide(width:1, color: HexColor('#0A81AB')),
                          // ),
                          //   child: Container(
                          //     width: 120,
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         Text('تحميل الصوره',style: TextStyle(color:  HexColor('#0A81AB'),),),
                          //         SizedBox(width: 10,),
                          //         Icon(
                          //           Icons.cloud_upload_outlined,
                          //           color: HexColor('#0A81AB'),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          //   onPressed:() {
                          //     HyahRegisterCubit.get(context)
                          //         .uploadIdCardImage();
                          //     print(urlImage);
                          //
                          //       ScaffoldMessenger.of(context)
                          //           .showSnackBar(
                          //       const SnackBar(
                          //       content: Text(
                          //       'الرجاء تصوير البطاقه',
                          //       style: TextStyle(fontSize: 18),
                          //       ),
                          //       backgroundColor: Colors.red,
                          //       ),
                          //       );
                          //
                          //   },
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defaultFormField(

                              validate: (String value) {
                                if (value.isEmpty) {
                                  return ' الرجاء إدخال رقم الهاتف';
                                }
                                else if(value.length != 11)
                                {
                                  return 'الرقم غير صحيح';
                                }
                              },
                              controller: phoneController,
                              type: TextInputType.number,

                              label: 'رقم الهـاتف',
                              hintText: " مثال 01xxxxxxxx",
                              prefix: Iconsax.mobile,
                              maxLength: 11,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            defaultFormField(

                              validate: (String value ) {


                                if (value.isEmpty) {
                                  return ' اخل الرقم السري';
                                }
                                 if (value.length < 8 ) {
                                  return '';
                                }
                                 if (!numericRegex.hasMatch(value) ) {
                                  return '';
                                }
                                 if (!alphanumeric.hasMatch(value) ) {
                                  return '';
                                }


                              },
                              onChanged: (String value ){
                                HyahRegisterCubit.get(context).onPasswordChanged(value);
                              },
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              suffic: HyahRegisterCubit.get(context).suffix,
                              suffixPressed: () {
                                HyahRegisterCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              label: 'الرقم السري',

                              prefix: Iconsax.lock_1,
                              isPassword: HyahRegisterCubit.get(context).isPassword,
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: HyahRegisterCubit.get(context).hasPasswordOneCharacter ?  Colors.green : Colors.transparent,
                                        border: HyahRegisterCubit.get(context).hasPasswordOneCharacter ? Border.all(color: Colors.transparent) :
                                        Border.all(color: Colors.grey.shade400),
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text("يحتوي على حرف كبير على الأقل",style: Theme.of(context).textTheme.caption,)
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: HyahRegisterCubit.get(context).hasPasswordOneNumber ?  Colors.green : Colors.transparent,
                                        border:HyahRegisterCubit.get(context).hasPasswordOneNumber ? Border.all(color: Colors.transparent) :
                                        Border.all(color: Colors.grey.shade400),
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text("يحتوي على رقم واحد على الأقل" ,style: Theme.of(context).textTheme.caption,)
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: HyahRegisterCubit.get(context).isPasswordEightCharacters ?  Colors.green : Colors.transparent,
                                        border:HyahRegisterCubit.get(context).isPasswordEightCharacters ? Border.all(color: Colors.transparent) :
                                        Border.all(color: Colors.grey.shade400),
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text("يحتوي على 8 أرقام أواحرف علي الاقل" ,style: Theme.of(context).textTheme.caption,)
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      ConditionalBuilder(
                        condition: state is! HyahRegisterLoadingState,
                        builder: (context) =>
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  if ( idCardImage == null && urlImage == null)
                                  defaultButton(
                                      function: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'الرجاء تحميل صوره البطاقه',
                                              style: TextStyle(fontSize: 18),
                                              textAlign: TextAlign.center,
                                            ),
                                            backgroundColor: Colors.deepOrangeAccent,
                                          ),
                                        );
                                      },
                                      text: 'الـتالي',
                                      isUpperCase: true,
                                      background: HexColor("#e17f61")),
                                  if (idCardImage != null && urlImage != null )
                                  defaultButton(
                                      function: () {
                                         if (formKey.currentState.validate() && idCardImage != null ) {
                                          HyahRegisterCubit.get(context).userRegister(
                                            name: name,
                                            email: email,
                                            password: passwordController.text,
                                            cardId: cardId,
                                            address: address,
                                            dateBirth: dateBirth,
                                            gender: gender,
                                            phone: phoneController.text,
                                            imageCardID: urlImage,
                                          );
                                        }
                                      },
                                      text: 'الـتالي',
                                      isUpperCase: true,
                                      background: HexColor("#e17f61")),
                                ],
                              ),
                            ),

                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 30,
                      ),
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
}








class HyahRegisterDone extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: HexColor('#0A81AB'),
                        radius: 50,
                        child: Icon(
                          Icons.check,
                          size: 80,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'تم التسجيل بنجاح ',
                          style: TextStyle(
                              fontSize: 30,
                              color: HexColor('#0A81AB'),
                              shadows: [
                                Shadow(
                                  offset: Offset(3.0, 3.0),
                                  blurRadius: 5.0,
                                  color: HexColor('#0A81AB').withOpacity(.7),
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, right: 50, left: 50),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: defaultButton(
                  function: () {
                    navigateAndFinish(context, HyahLoginScreen());
                  },
                  text: 'تسجيل الدخول',
                  isUpperCase: true,
                  background: HexColor("#e17f61")),
            ),
          ),
        ],
      ),
    );
  }
}
