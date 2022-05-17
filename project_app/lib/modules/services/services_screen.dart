



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_app/layout/cubit/cubit.dart';
import 'package:project_app/modules/medical_help/medical_help_screen.dart';
import 'package:project_app/modules/control_panel/control_panel_screen.dart';
import 'package:project_app/modules/corona_check/corona_check_screen.dart';
import 'package:project_app/modules/health_passport/health_passport_screen.dart';
import 'package:project_app/modules/health_status/health_status_screen.dart';
import 'package:project_app/modules/permissions/permissions_screen.dart';
import 'package:project_app/modules/qr_code/qr_coed_screen.dart';
import 'package:project_app/modules/web_view/web_view_screen.dart';
import 'package:project_app/shared/components/components.dart';

class ServicesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var userModel = HyahCubit.get(context).userModel;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 5,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                    color: HexColor('#5DACC7'),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 140,
                    width: 150,
                    child: InkWell(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                         return WebViewScreen("https://egcovac.mohp.gov.eg/",'لقاح كورونا');
                      }));
                      } ,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20,bottom: 20),
                            child: Stack(

                              children: [
                                Image.asset('assets/images/vaccine.png',width: 60,),

                              ],
                            ),
                          ),
                          Expanded(
                            child: Stack(

                              children: [

                                Text('لقاح كورونا')

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                    color: HexColor('#5DACC7'),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 140,
                    width: 150,
                    child: InkWell(
                      onTap: ()
                      {
                        navigateTo(context, ControlPanelScreen());
                      } ,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20,bottom: 20),
                            child: Stack(

                              children: [
                                Image.asset('assets/images/control-panel.png',width: 60,),

                              ],
                            ),
                          ),
                          Expanded(
                            child: Stack(

                              children: [

                                Text('لوحة البينات')

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        color: HexColor('#5DACC7'),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 140,
                    width: 150,
                    child: InkWell(
                      onTap: (){
                        navigateTo(context, QrCodeScreen());
                      } ,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20,bottom: 20),
                            child: Stack(

                              children: [
                                Image.asset('assets/images/qr.png',width: 60,),

                              ],
                            ),
                          ),
                          Expanded(
                            child: Stack(

                              children: [

                                Text('QR CODE')

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        color: HexColor('#5DACC7'),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 140,
                    width: 150,
                    child: InkWell(
                      onTap: ()
                      {
                        navigateTo(context, PermissionsScreen());
                      } ,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20,bottom: 20),
                            child: Stack(

                              children: [
                                Image.asset('assets/images/checking.png',width: 60,),

                              ],
                            ),
                          ),
                          Expanded(
                            child: Stack(

                              children: [

                                Text('التصاريح')

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                    color: HexColor('#5DACC7'),
                    borderRadius: BorderRadius.all(Radius.circular(20),),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],

                    ),
                    height: 140,
                    width: 150,
                    child: InkWell(
                      onTap: (){
                        navigateTo(context, CoronaCheckScreen());
                      } ,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20,bottom: 20),
                            child: Stack(

                              children: [
                                Image.asset('assets/images/microscope.png',width: 60,),

                              ],
                            ),
                          ),
                          Expanded(
                            child: Stack(

                              children: [

                                Text('فحص كورونا')

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                    color: HexColor('#5DACC7'),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 140,
                    width: 150,
                    child: InkWell(
                      onTap: ()
                      {
                        navigateTo(context, HealthStatusScreen());
                      } ,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20,bottom: 20),
                            child: Stack(

                              children: [
                                Image.asset('assets/images/healthcare.png',width: 60,),

                              ],
                            ),
                          ),
                          Expanded(
                            child: Stack(

                              children: [

                                Text('الحالة الصحيه')

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        color: HexColor('#5DACC7'),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 140,
                    width: 150,
                    child: InkWell(
                      onTap: () async
                      {

                        if( userModel.theVaccineVerify == "wait")
                          showToast( message: ' الرجاء الأنتظار لحين اصدار الجواز الصحي ', state: ToastState .ERROR );
                        if( userModel.theVaccineVerify == "false")
                          navigateTo(context,  HealthPassportScreen());
                        if( userModel.theVaccineVerify == "true")
                          navigateTo(context,  HealthPassportScreen());
                      } ,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20,bottom: 20),
                            child: Stack(

                              children: [
                                Image.asset('assets/images/covid-passport.png',width: 60,),

                              ],
                            ),
                          ),
                          Expanded(
                            child: Stack(

                              children: [

                                Text('الجواز الصحي')

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        color: HexColor('#5DACC7'),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 140,
                    width: 150,
                    child: InkWell(
                      onTap: (){
                        navigateTo(context, MedicalHelpScreen());
                      } ,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20,bottom: 20),
                            child: Stack(

                              children: [
                                Image.asset('assets/images/assistant.png',width: 60,),

                              ],
                            ),
                          ),
                          Expanded(
                            child: Stack(

                              children: [

                                Text('المساعده الطبية')

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
