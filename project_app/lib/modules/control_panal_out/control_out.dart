
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:project_app/layout/cubit/cubit.dart';
import 'package:project_app/modules/register/cubit/cubit.dart';
import 'package:project_app/modules/register/cubit/state.dart';
import 'package:project_app/shared/components/components.dart';

class ControlPanelOutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => HyahRegisterCubit(),
        child: BlocConsumer<HyahRegisterCubit, HyahRegisterStates>(
            listener: (context, state){

              if(state is HyahUploadDrivingLicenseImageSuccessState  ) {
                navigateAndFinish(context, ControlPanelOutScreen());

              }

            },
            builder: (context, state){
              var userModel = HyahCubit.get(context).userModel;
              var imageDrivingLicense = HyahRegisterCubit.get(context).imageDrivingLicense;

              return Scaffold(

                body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 8
                        ),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Theme.of(context).cardColor,
                          elevation:15,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 17),
                                child: Column(

                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text('الأسم',style: TextStyle(fontSize: 14),),
                                              SizedBox(height: 10,),
                                              Text('${userModel.name}',style: Theme.of(context).textTheme.caption)
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text('رقم الهاتف',style: TextStyle(fontSize: 14)),
                                              SizedBox(height: 10,),
                                              Text('${userModel.phone}',style: Theme.of(context).textTheme.caption)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 30,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text('تاريخ الميلاد' ,style: TextStyle(fontSize: 14)),
                                              SizedBox(height: 10,),
                                              Text('${userModel.dateBirth}',style: Theme.of(context).textTheme.caption)
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text('فصيلة الدم' ,style: TextStyle(fontSize: 14)),
                                              SizedBox(height: 10,),
                                              Text('O+' ,style: Theme.of(context).textTheme.caption)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 25),
                        child: Container(
                          child: Row(

                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Icon(Icons.info_outline ,size: 20,color: Theme.of(context).textTheme.subtitle1.color,),
                              ),
                              SizedBox(width: 5,),
                              Text(' البطاقه الشخصية',
                                style: Theme.of(context).textTheme.caption,),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 180,
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 10,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child:

                          FullScreenWidget(
                            backgroundIsTransparent: true,
                            child: Center(
                              child: Hero(
                                tag: "imageCardID",
                                child: PinchZoomImage(
                                  hideStatusBarWhileZooming: false,
                                  onZoomStart: () {
                                    print('Zoom started');
                                  },
                                  onZoomEnd: () {
                                    print('Zoom finished');
                                  },
                                  image: Image.network('${userModel.imageCardID}',
                                    fit: BoxFit.cover,

                                    width: double.infinity,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      if(userModel.drivingLicenseImage != '' && imageDrivingLicense == null && userModel.drivingLicenseImage != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 25),
                        child: Container(
                          child: Row(

                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Icon(Icons.info_outline ,size: 20,color: Theme.of(context).textTheme.subtitle1.color,),
                              ),
                              SizedBox(width: 5,),
                              Text(' رخصه القيادة',
                                style: Theme.of(context).textTheme.caption,),
                            ],
                          ),
                        ),
                      ),
                      if(userModel.drivingLicenseImage != '' && imageDrivingLicense == null && userModel.drivingLicenseImage != null)
                      Container(
                          height: 180,
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 10,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child:

                            FullScreenWidget(
                              backgroundIsTransparent: true,
                              child: Center(
                                child: Hero(
                                  tag: "drivingLicenseImage",
                                  child: PinchZoomImage(
                                    hideStatusBarWhileZooming: false,
                                    onZoomStart: () {
                                      print('Zoom started');
                                    },
                                    onZoomEnd: () {
                                      print('Zoom finished');
                                    },
                                    image: Image.network('${userModel.drivingLicenseImage}',
                                      fit: BoxFit.cover,

                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),

                    ],
                  ),
                ),


              );
            }
        )
    );
  }
}
