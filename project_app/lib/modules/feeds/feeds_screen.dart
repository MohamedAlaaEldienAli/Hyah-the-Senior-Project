import 'dart:typed_data';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:project_app/layout/cubit/cubit.dart';
import 'package:project_app/layout/cubit/states.dart';
import 'package:project_app/models/posts/post_model.dart';
import 'package:project_app/modules/register/cubit/state.dart';
import 'package:project_app/shared/components/components.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';





class FeedsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HyahCubit, HyahStates>(
      listener: (context, state) {
        // navigateAndFinish(context, FeedsScreen());
      },
      builder: (context, state) {
        var userModel = HyahCubit
            .get(context)
            .userModel;
        var profileImage = HyahCubit
            .get(context)
            .profileImage;
        var dateupdate = HyahCubit
            .get(context)
            .dateTime;



        return ConditionalBuilder(
          condition: HyahCubit
              .get(context)
              .userModel != null,
          builder: (context) =>
              Center(
                child: Scaffold(
                  appBar: AppBar(
                    toolbarHeight: 10,
                    systemOverlayStyle:
                    SystemUiOverlayStyle(statusBarColor: Colors.white),
                    elevation: 0,
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    CircleAvatar(
                                      radius: 64,
                                      backgroundColor: HexColor('#0A81AB'),
                                      child: CircleAvatar(
                                        radius: 60,
                                        backgroundImage:  NetworkImage(
                                          '${userModel.image}',
                                        )

                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Text('${userModel.name}',
                                            style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 20)),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text('${userModel.cardId}',
                                                style: Theme.of(context).textTheme.caption.copyWith(fontSize: 15))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              if (userModel.confirmationOfInjury == 0)
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Colors.grey,
                                  elevation: 15,
                                  child: Stack(
                                    alignment: AlignmentDirectional.bottomStart,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(10.0),
                                              child: Container(
                                                height: 120,
                                                width: 120,
                                                child: SfBarcodeGenerator(
                                                  value: 'not found',
                                                  symbology: QRCode(),
                                                  showValue: false,
                                                  barColor: Colors.white,
                                                ),
                                              )),
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                'الحاله غير معروفه',
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .subtitle1
                                                    .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                'أخر تحديث : ${dateupdate ??
                                                    "الرجاء تحديث الوقت"}',
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .caption
                                                    .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              HyahCubit.get(context)
                                                  .dateUpdate();
                                              HyahCubit.get(context)
                                                  .getUserData();
                                              showToast(
                                                  message: " تم التحديث بنجاح",
                                                  state: ToastState.SUCCESS);
                                            },
                                            icon: Icon(Iconsax.refresh),
                                            iconSize: 25,
                                            color: Colors.white,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              if (userModel.confirmationOfInjury == 1)
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Colors.green,
                                  elevation: 15,
                                  child: Stack(
                                    alignment: AlignmentDirectional.bottomStart,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(10.0),
                                              child: Container(
                                                height: 120,
                                                width: 120,
                                                child: SfBarcodeGenerator(
                                                  value: 'ID Number = ${userModel.cardId} , DateBirth = ${userModel.dateBirth} , Gender = ${userModel.gender} ,',
                                                  symbology: QRCode(),
                                                  showValue: false,
                                                  barColor: Colors.white,
                                                ),
                                              )),
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                'لم تثبت إصابته',
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .subtitle1
                                                    .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 22),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                'أخر تحديث : ${dateupdate ??
                                                    "الرجاء تحديث الوقت"}',
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .caption
                                                    .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              HyahCubit.get(context)
                                                  .dateUpdate();
                                              HyahCubit.get(context)
                                                  .getUserData();
                                              showToast(
                                                  message: " تم التحديث بنجاح",
                                                  state: ToastState.SUCCESS);
                                            },
                                            icon: Icon(Iconsax.refresh),
                                            iconSize: 25,
                                            color: Colors.white,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              if (userModel.confirmationOfInjury == 2)
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: HexColor('#ffcb2c'),
                                  elevation: 15,
                                  child: Stack(
                                    alignment: AlignmentDirectional.bottomStart,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(10.0),
                                              child: Container(
                                                height: 120,
                                                width: 120,
                                                child: SfBarcodeGenerator(
                                                  value: 'ID Number = ${userModel.cardId} , DateBirth = ${userModel.dateBirth} , Gender = ${userModel.gender} ,',
                                                  symbology: QRCode(),
                                                  showValue: false,
                                                  barColor: Colors.black,
                                                ),
                                              )),
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                'حالة أشتباه',
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .subtitle1
                                                    .copyWith(
                                                    color: Colors.black,
                                                    fontSize: 22),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                'أخر تحديث : ${dateupdate ??
                                                    "الرجاء تحديث الوقت"}',
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .caption
                                                    .copyWith(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          if (state is HyahLoadingState)
                                            Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: LinearProgressIndicator(
                                                backgroundColor: Colors.white,
                                                color: HexColor('#0A81AB'),
                                              ),
                                            ),
                                          IconButton(
                                            onPressed: () {
                                              HyahCubit.get(context)
                                                  .dateUpdate();
                                              HyahCubit.get(context)
                                                  .getUserData();
                                              showToast(
                                                  message: " تم التحديث بنجاح",
                                                  state: ToastState.SUCCESS);
                                            },
                                            icon: Icon(Iconsax.refresh),
                                            iconSize: 25,
                                            color: Colors.black,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              if (userModel.confirmationOfInjury == 3)
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: HexColor('d62828'),
                                  elevation: 15,
                                  child: Stack(
                                    alignment: AlignmentDirectional.bottomStart,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(10.0),
                                              child: Container(
                                                height: 120,
                                                width: 120,
                                                child: SfBarcodeGenerator(
                                                  value: 'ID Number = ${userModel.cardId} , DateBirth = ${userModel.dateBirth} , Gender = ${userModel.gender} , ',
                                                  symbology: QRCode(),
                                                  showValue: false,
                                                  barColor: Colors.white,
                                                ),
                                              )),
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                'مـصـاب',
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .subtitle1
                                                    .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 22),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                'أخر تحديث : ${dateupdate ??
                                                    "الرجاء تحديث الوقت"}',
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .caption
                                                    .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              HyahCubit.get(context)
                                                  .dateUpdate();
                                              HyahCubit.get(context)
                                                  .getUserData();
                                              showToast(
                                                  message: " تم التحديث بنجاح",
                                                  state: ToastState.SUCCESS);
                                            },
                                            icon: Icon(Iconsax.refresh),
                                            iconSize: 25,
                                            color: Colors.white,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          fallback: (context) => Center(child: SpinKitDoubleBounce(
            color: HexColor('#0A81AB'),
            size: 70,

          )),
        );
      },
    );
  }

}

