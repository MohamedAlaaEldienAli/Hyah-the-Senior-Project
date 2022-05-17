import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_app/layout/cubit/cubit.dart';
import 'package:project_app/layout/cubit/states.dart';
import 'package:project_app/modules/register/cubit/cubit.dart';
import 'package:project_app/modules/settings_screen/settings_screen.dart';
import 'package:project_app/shared/components/components.dart';


class HomeHyahScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) =>
          HyahRegisterCubit(),
      child: BlocConsumer <HyahCubit ,HyahStates>(
        listener: (context , state) async {

        },
        builder: (context , state) {

          var cubit = HyahCubit.get(context);


          return Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo_ligth.png',
                    fit: BoxFit.cover ,
                    height: 240,
                  ),
                ],
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
              elevation: 10,

            ),
            body: cubit.screens[cubit.currentIndex],

            bottomNavigationBar:

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GNav(
                rippleColor: Colors.grey[400],
                hoverColor: Colors.grey[100],
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: HexColor('#0A81AB'),
                color: Colors.black,
                tabs: [
                  GButton(
                    icon: Iconsax.home_1,
                    text: 'الرئيسية',
                    textColor: Colors.white,
                    iconActiveColor: Colors.white,
                  ),
                  GButton(
                    icon: Iconsax.activity,
                    text: 'الخدمات',
                    textColor: Colors.white,
                    iconActiveColor: Colors.white,
                  ),
                  GButton(
                    icon: Iconsax.card_edit,
                    text: 'لوحة البينات',
                    textColor: Colors.white,
                    iconActiveColor: Colors.white,
                  ),
                  GButton(
                    icon: Iconsax.user,
                    text: 'حسابي',
                    textColor: Colors.white,
                    iconActiveColor: Colors.white,
                  ),
                ],
                selectedIndex: cubit.currentIndex,
                onTabChange: (index) {
                  cubit.changeBottomNav(index);
                },
              ),
            ),



            // BottomNavigationBar(
            //   currentIndex: cubit.currentIndex,
            //   onTap: (index)
            //   {
            //     cubit.changeBottomNav(index);
            //   },
            //   items:
            //   [
            //     BottomNavigationBarItem(
            //         icon: Icon(Iconsax.home_1),label: 'Home'),
            //     BottomNavigationBarItem(
            //         icon: Icon(Iconsax.activity),label: 'Services'),
            //     BottomNavigationBarItem(
            //         icon: Icon(Iconsax.card_edit),label: 'Control Panel'),
            //     BottomNavigationBarItem(
            //         icon: Icon(Iconsax.profile_2user),label: 'Profile'),
            //
            //   ],
            //
            // ),

            // Column(
            //   children: [
            //     ConditionalBuilder(
            //       condition: HyahCubit.get(context).model != null,
            //       builder: (context)
            //       {
            //        // var model = HyahCubit.get(context).model;
            //         return Column(
            //           children: [
            //
            //           // if(!FirebaseAuth.instance.currentUser.emailVerified)
            //           //   Container(
            //           //     color:  Colors.yellow.withOpacity(0.7) ,
            //           //     child: Padding(
            //           //       padding: const EdgeInsets.symmetric(horizontal: 20),
            //           //       child: Row(
            //           //         children: [
            //           //           Icon(Icons.info_outline),
            //           //           SizedBox(width: 13,),
            //           //           Expanded(child: Text('please verify your email ',style: TextStyle(fontSize: 18),)),
            //           //           SizedBox(width: 20,),
            //           //           defaultTextButton(
            //           //               function: ()
            //           //               {
            //           //                 FirebaseAuth.instance.currentUser.sendEmailVerification().
            //           //                 then((value) {
            //           //                   showToast(
            //           //                       message: 'check your Email',
            //           //                       state: ToastState.SUCCESS,
            //           //                   );
            //           //                 }).
            //           //                 catchError((error){
            //           //                 });
            //           //               },
            //           //               text: 'send'),
            //           //
            //           //         ],
            //           //       ),
            //           //     ),
            //           //   ),
            //
            //           ],
            //         );
            //       },
            //       fallback:(context) => Center(child: CircularProgressIndicator()),
            //     ),
            //     Center(
            //
            //       child: Text(' Hyah Home',style: TextStyle(fontSize: 40),),
            //     ),
            //
            //   ],
            // ),
          );
        },
      ),
    );
  }
}
