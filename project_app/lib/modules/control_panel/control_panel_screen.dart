

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
import 'package:syncfusion_flutter_barcodes/barcodes.dart';


class ControlPanelScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => HyahRegisterCubit(),
      child: BlocConsumer<HyahRegisterCubit, HyahRegisterStates>(
          listener: (context, state) async {
            await  HyahCubit.get(context)
                .getUserData();
            if(state is HyahUploadDrivingLicenseImageSuccessState  ) {
              navigateAndFinish(context, ControlPanelScreen());

            }

          },
          builder: (context, state){
            var userModel = HyahCubit.get(context).userModel;
            var urlDrivingLicense = HyahRegisterCubit.get(context).urlDrivingLicense;
            var imageDrivingLicense = HyahRegisterCubit.get(context).imageDrivingLicense;

            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Center(
                    child: Text(
                      "لوحه البيانات ",
                      style: TextStyle(color: Colors.white, fontSize: 26, shadows: [
                        Shadow(
                          offset: Offset(0, 6.0),
                          blurRadius: 7.0,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ]),
                    )),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(40),
                  ),
                ),
                toolbarHeight:90,
                automaticallyImplyLeading: false,
                backwardsCompatibility: false,
                backgroundColor: HexColor('#0A81AB'),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('#0A81AB'),
                  statusBarIconBrightness: Brightness.light,
                ),
                elevation: 15,
                actions: [
                  InkWell(
                    onTap: (){
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
              ) ,
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
                    Column(
                      children: [
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
                      ],
                    ),
                    SizedBox(height: 8,),
                    if(imageDrivingLicense != null || userModel.drivingLicenseImage != '' && userModel.drivingLicenseImage == '')
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
                              tag: "pic",
                              child: Image(
                                          image: imageDrivingLicense != null
                                              ? FileImage(imageDrivingLicense)
                                              : null,
                                          fit: BoxFit.cover,
                                          height: 180,
                                          width: double.infinity,
                                        ),

                            ),
                          ),
                        ),
                      ),
                    ),
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
                              Text(' رخصه القياده',
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
                    if( state is HyahLoadingState)
                      Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 15),
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.white,
                                color: HexColor('#0A81AB'),

                              ),
                            ),
                    if(imageDrivingLicense != null )
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Container(
                          child: FloatingActionButton.extended(
                            onPressed: ()
                            {

                              HyahRegisterCubit.get(context)
                                  .uploadDrivingLicenseImage(context);
                              print(urlDrivingLicense);



                            },
                            label: Text("رفع صوره رخصه القياده"),
                            icon: Icon(Icons.cloud_upload),
                          ),
                        ),
                      ),

                  ],
                ),
              ),

              floatingActionButton:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          child: Icon(Icons.add_a_photo_outlined ,color: Colors.white,),
                          onPressed: ()
                          {
                            HyahRegisterCubit.get(context).getDrivingLicenseImage();
                          },
                        ),
                      ),
                    ),

                    // if(imageDrivingLicense != null )
                    //   Padding(
                    //     padding: const EdgeInsets.only(right: 10),
                    //     child: Container(
                    //       child: FloatingActionButton.extended(
                    //         onPressed: ()
                    //         {
                    //
                    //           HyahRegisterCubit.get(context)
                    //               .uploadDrivingLicenseImage(context);
                    //           print(urlDrivingLicense);
                    //
                    //
                    //
                    //         },
                    //         label: Text("رفع صوره رخصه القياده"),
                    //         icon: Icon(Icons.cloud_upload),
                    //       ),
                    //     ),
                    //   ),


                  ],
                ),
              ),
            );
          }
      )
    );
  }
}





