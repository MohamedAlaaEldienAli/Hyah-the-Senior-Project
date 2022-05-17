

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_app/layout/cubit/home.dart';
import 'package:project_app/modules/on_boarding_screen/on_boarding_screen.dart';
import 'package:project_app/shared/components/components.dart';
import 'package:project_app/shared/cubit/cubit.dart';
import 'package:project_app/shared/cubit/states.dart';
import 'package:project_app/shared/network/local/cache_helper.dart';
import 'package:project_app/shared/network/remote/dio_helper.dart';
import 'package:project_app/styles/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; //مكتبه خاصه باللغه
import 'package:splashscreen/splashscreen.dart';
import 'layout/cubit/cubit.dart';


import 'styles/themes.dart';


void main() async {
  //هنا بيتاكد ان كل حاجه في المثود خلصت وبعدين يفتح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await DioHelper.init();
  await CacheHelper.init();

  bool isDark = CacheHelper.getBoolean(key: 'isDark');

  Widget widget;
  bool onBoarding = CacheHelper.getData(key:'onBoarding');
  uId = CacheHelper.getData(key: 'uId');

  if (uId != null) {
    widget = HomeHyahScreen();
  } else {
    widget = OnBoardingScreen();
  }
  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}


class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;

  MyApp({this.isDark, @required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => AppCubit()..changeAppMode(fromShared: isDark),
              ),
        BlocProvider(
          create: (BuildContext context) => HyahCubit()..getUserData()
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            // ==== لتحديد اللغه المستغدمه
            localizationsDelegates: [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              Locale("ar", "AR"), // OR Locale('ar', 'AE') OR Other RTL locales
            ],
            locale: Locale("ar", "AR"),
            //==============================

            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme ,
            themeMode:  AppCubit.get(context).isDark ? ThemeMode.light :ThemeMode.dark,
             home:

             SplashScreen(
                 seconds: 3,
                 navigateAfterSeconds: startWidget,
                 image: new Image(
                      image:
                      AssetImage('assets/images/logo_ligth.png'),
                      fit: BoxFit.cover, ),
                 backgroundColor: HexColor('#0A81AB'),
                 styleTextUnderTheLoader: new TextStyle(),
                 photoSize: 190.0,
                 loaderColor: Colors.white

             )


          );
        }, //////
      ),
    );
  }
}

