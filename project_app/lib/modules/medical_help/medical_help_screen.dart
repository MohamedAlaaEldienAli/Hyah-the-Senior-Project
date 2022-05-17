import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_app/shared/components/components.dart';
import 'package:url_launcher/url_launcher.dart' ;

class MedicalHelpScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(
          child: Image.asset('assets/images/logo_ligth.png',
            fit: BoxFit.cover ,
            height: 240,
          ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset('assets/images/assistant.png',height: 170,),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(' اذا كان لديك أي تساؤلات حول فيروس كورونا2019 وترغب في المساعدة الطبية , يمكنك التواصل معنا عبر الخط الساخن 105 او 15335',
                        style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 17),
                          textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: HexColor('#9d0208'),
                boxShadow: [
                  BoxShadow(
                    color: HexColor('#d00000'),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: InkWell(
                onTap: ()
                {
                  launch('tel://15335');


                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('اتصل للمساعدة', style: TextStyle(fontSize: 22,color: Colors.white),),
                    SizedBox(width: 10,),
                    Icon(Icons.call ,size: 32, color: Colors.white,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
