import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:project_app/layout/cubit/cubit.dart';
import 'package:project_app/layout/cubit/states.dart';
import 'package:project_app/modules/register/cubit/cubit.dart';
import 'package:project_app/modules/register/cubit/state.dart';
import 'package:project_app/shared/components/components.dart';

import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class HealthStatusScreen extends StatelessWidget {
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context) => HyahRegisterCubit(),
        child: BlocConsumer<HyahRegisterCubit, HyahRegisterStates>(
        listener: (context, state) async {
          await  HyahCubit.get(context)
              .getUserData();
            if(state is HyahUploadVaccineImageSuccessState) {
              navigateAndFinish(context, HealthStatusScreen());


               }

        },
        builder: (context, state) {
          var userModel = HyahCubit.get(context).userModel;
          var profileImage = HyahCubit.get(context).profileImage;
          var dateupdate = HyahCubit.get(context).dateTime;
          var urlVaccineImage = HyahRegisterCubit.get(context).urlVaccineImage;
          var imageVaccine = HyahRegisterCubit.get(context).imageVaccine;

          return ConditionalBuilder(
            condition: HyahCubit
                .get(context)
                .userModel != null,
            builder: (context) => Center(
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Center(
                      child: Text(
                    "الحاله الصحيه",
                    style:
                    TextStyle(color: Colors.white, fontSize: 26, shadows: [
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
                  toolbarHeight: 90,
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
                body: Center(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [

                          Container(
                            child: Column(
                              children: [

                                CircleAvatar(
                                  radius: 47,
                                  backgroundColor: HexColor('#5DACA5'),
                                  child: CircleAvatar(
                                    radius: 44,
                                    backgroundImage:  NetworkImage(
                                            '${userModel.image}',
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Text('${userModel.name}',style: TextStyle(fontSize: 18),),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'الرجاء التكرم برفع صوره من شهاده تطعيم كورونا , لكي تتمكن من الحصول علي ميزه الجواز الصحي أذا اكملت جرعتين من لقاح كورونا  ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .copyWith(fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
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
                          //if(userModel.vaccineImage != '' && imageVaccine == null && userModel.vaccineImage != null)


                          if(imageVaccine != null || userModel.vaccineImage != '' && userModel.vaccineImage == '')
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
                                      tag: "oiyu",
                                      child: Image(
                                        image: imageVaccine != null
                                            ? FileImage(imageVaccine)
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
                          SizedBox(height: 8,),
                         if( state is HyahVaccineImageLoadingState)
                            Padding(
                              padding: const EdgeInsets.only(left: 30,right: 30 , bottom: 20),
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.white,
                                color: HexColor('#0A81AB'),

                              ),
                            ),
                          if(userModel.vaccineImage != '' && imageVaccine == null && userModel.vaccineImage != null)
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                    horizontal: 5),
                                child: Container(
                                  child: Row(

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 4.0),
                                        child: Icon(Icons.info_outline ,size: 20,color: Theme.of(context).textTheme.subtitle1.color,),
                                      ),
                                      SizedBox(width: 5,),
                                      Text('شهادة تطعيم كورونا',
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
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child:

                                  FullScreenWidget(
                                    backgroundIsTransparent: true,
                                    child: Center(
                                      child: Hero(
                                        tag: "po",
                                        child: PinchZoomImage(
                                          hideStatusBarWhileZooming: false,
                                          onZoomStart: () {
                                            print('Zoom started');
                                          },
                                          onZoomEnd: () {
                                            print('Zoom finished');
                                          },
                                          image: Image.network('${userModel.vaccineImage}',
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


                        ],
                      ),
                    ),
                  ),
                ),
                  floatingActionButton: Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Row(

                      children: [

                        SpeedDial(
                          spacing: 10,
                          spaceBetweenChildren: 12,
                          foregroundColor: Colors.white,
                          animatedIcon: AnimatedIcons.menu_close,
                          overlayColor:HexColor('#0A81AB'),
                          overlayOpacity: 0.4,
                          children: [
                            SpeedDialChild(
                                child: Icon(Iconsax.camera),
                              backgroundColor: HexColor('e9c46a'),
                              onTap: ()async
                              {
                                await HyahRegisterCubit.get(context).getVaccineImage();
                                await  HyahCubit.get(context)
                                    .getUserData();


                              },

                            ),
                            SpeedDialChild(
                              onTap:() async {

                                await  HyahCubit.get(context)
                                    .dateUpdate();
                                await  HyahCubit.get(context)
                                    .getUserData();
                                navigateAndFinish(context, HealthStatusScreen());
                                showToast(
                                    message: " تم التحديث بنجاح",
                                    state: ToastState.SUCCESS);
                                } ,
                              backgroundColor: HexColor('94d2bd'),
                                child: Icon(Iconsax.refresh),

                            ),


                          ],
                        ),
                       if(imageVaccine != null )
                       Padding(
                         padding: const EdgeInsets.only(right: 10.0),
                         child: FloatingActionButton(
                            onPressed: () async {
                              if(state is HyahVaccineImageLoadingState)
                                showToast(message: "جاري تحميل الصوره", state: ToastState.WARNING);

                                HyahRegisterCubit.get(context).uploadVaccineImage(context);


                               if(state is HyahUploadVaccineImageErrorState)
                                showToast(message: "فشل التحميل", state: ToastState.ERROR);

                              print(urlVaccineImage);
                            } ,
                            child: Icon(Icons.cloud_upload,color: HexColor('0A81AB'),),
                            backgroundColor: HexColor('e9c46a'),

                          ),
                       ),


                        //
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 10),
                        //   child: Container(
                        //     child: FloatingActionButton.extended(
                        //       onPressed: ()
                        //       {
                        //
                        //
                        //       },
                        //       foregroundColor: Colors.white,
                        //       label: Text("رفع صوره الشهاده"),
                        //       icon: Icon(Icons.cloud_upload),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  )
              ),
            ),
            fallback: (context) => Center(child: SpinKitDoubleBounce(
              color: HexColor('#0A81AB'),
              size: 50,

            ),),
          );
        },
      ),


    );
}
}
