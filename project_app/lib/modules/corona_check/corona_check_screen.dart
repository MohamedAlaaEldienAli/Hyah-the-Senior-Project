import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_app/modules/web_view/web_view_screen.dart';
import 'package:project_app/shared/components/components.dart';

class CoronaCheckScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Center(
                child: Text(
                  "فحص كورونا ",
                  style: TextStyle(color: Colors.white, fontSize: 26, shadows: [
                    Shadow(
                      offset: Offset(0, 6.0),
                      blurRadius: 7.0,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ]),
                )),
            Center(
                child: Text(
                  "[ PCR ]",
                  style: TextStyle(color: Colors.white, fontSize: 15, shadows: [
                    Shadow(
                      offset: Offset(0, 6.0),
                      blurRadius: 7.0,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ]),
                )),
          ],
        ),
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
        elevation: 8,
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
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 210,
                    width: 150,
                    child: InkWell(
                      onTap: ()
                      {
                        navigateTo(context, CoronaCheckLabsScreen(
                          appBarTitle: 'معمال البرج',
                          pathImage: 'assets/images/index.jpg',
                          description: 'ويقدم المعمل التحليل عبارة عن مسحة من الأنف عن طريق زيارة منزلية فقط، ويكون سعر التحليل 2000 جنيه بالإضافة إلى 100 جنيه سعر الزيارة المنزلية، وتظهر نتيجة التحليل خلال 24 ساعة .',
                          hotLine: 'الرقم الساخن  1991',
                          webViewUrl: 'https://www.alborglab.com/web/alborg-lab/servicedetails?articleId=156031',
                          webViewTitle: 'معامل البرج',
                        ));
                      } ,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)
                            ),
                            child: Image.asset('assets/images/index.jpg',

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(' البرج' ,style: TextStyle(color: Colors.black ,fontSize: 20),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 0),  // changes position of shadow
                        ),
                      ],
                    ),
                    height: 210,
                    width: 150,
                    child: InkWell(
                      onTap: ()
                      {
                        navigateTo(context, CoronaCheckLabsScreen(
                          appBarTitle: 'PCR Portal',
                          pathImage: 'assets/images/egyptpcr.jpg',
                          description: 'خدمة الاختبار المنزلي COVID-19 RT-PCR ، والتي يتم توفيرها من خلال موظفي المختبرات المحترفين وذوي الخبرة. إذا كنت في عجلة من أمرك أو كنت بحاجة إلى السفر بشكل عاجل ، فنحن نقدم أيضًا اختبار Express و VIP COVID-19 RT-PCR ، حيث يمكنك الحصول على تقاريرك في غضون ساعتين (2) من مسحة RT-PCR. يتم دعم جميع عملياتنا من خلال مركز الاتصال المخصص وفريق خدمة العملاء الذي يعمل بلا كلل للإجابة على جميع استفساراتك.',
                          hotLine: 'الرقم الساخن 20233335562+',
                          webViewUrl: 'https://egyptpcr.com/',
                          webViewTitle: 'Egypt PCR Portal',
                        ));
                      } ,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)
                            ),
                            child: Container(
                              color: Colors.white,
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset('assets/images/egyptpcr.png' ,

                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(' PCR Portal' ,style: TextStyle(color: Colors.black ,fontSize: 20),),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 0),  // changes position of shadow
                        ),
                      ],
                    ),
                    height: 210,
                    width: 150,
                    child: InkWell(
                      onTap: ()
                      {
                        navigateTo(context, CoronaCheckLabsScreen(
                          appBarTitle: 'A PLUS LAB',
                          pathImage: 'assets/images/APLUSLAB.jpg',
                          description: 'التكلفة 1500 جنيه. النتيجة في غضون 3 ساعات فقط . يجب إرسال جواز السفر مباشرة بعد الحجز. يتم أخذ العينة من المنزل بواسطة متخصصين على أعلى مستوى. يتم تسليم النتائج [ PDF ] تخضع المعامل لوزارة الصحة والشهادة معتمدة من وزارة الصحة  IOS 9001، IAF',
                          hotLine: 'الرقم الساخن 16191',
                          webViewUrl: 'https://www.pcrfromhome.com/',
                          webViewTitle: 'A PLUS LAB',
                        ));
                      } ,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)
                            ),
                            child: Image.asset('assets/images/APLUSLAB.jpg',

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(' A PLUS LAB' ,style: TextStyle(color: Colors.black ,fontSize: 20),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 0),  // changes position of shadow
                        ),
                      ],
                    ),
                    height: 210,
                    width: 150,
                    child: InkWell(
                      onTap: ()
                      {
                        navigateTo(context, CoronaCheckLabsScreen(
                          appBarTitle: 'ألفا سكان',
                          pathImage: 'assets/images/alfa.png',
                          description: 'يقدم معمل ألفا سكان ، مجموعة تحاليل خاصة بالجهاز التنفسي للاطمئنان على الجهاز التنفسي تضم CBC -ALT-CRP titre -LDH-Ferritin – ESR – D-dimer، بسعر 1000 جنيه عبارة عن عينات دم فقط وليست مسحة بالأنف، وتظهر النتائج خلال 48 ساعة .',
                          hotLine: 'الرقم الساخن 16191',
                          webViewUrl: 'https://www.alfalaboratory.com/arabic/index.php/services/patient-service/2020-04-20-15-12-58',
                          webViewTitle: 'ألفا سكان',
                        ));
                      } ,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)
                            ),
                            child: Image.asset('assets/images/alfa.png',

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(' ألفا سكان' ,style: TextStyle(color: Colors.black ,fontSize: 20),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 0),  // changes position of shadow
                        ),
                      ],
                    ),
                    height: 210,
                    width: 150,
                    child: InkWell(
                      onTap: ()
                      {
                        navigateTo(context, CoronaCheckLabsScreen(
                          appBarTitle: 'معامل المختبر',
                          pathImage: 'assets/images/elmoktbr.jpg',
                          description: 'تحليل PCR عبارة عن مسحة من الأنف يمكن إجراءه في القاهرة والمحافظات من أي فرع، أو حجز زيارة منزلية، ويكون سعر التحليل 2000 جنيه، بالإضافة إلى 100 جنيه سعر الزيارة المنزلية ، و تظهر النتيجة خلال 15 دقيقة .',
                          hotLine: 'الرقم الساخن  19014',
                          webViewUrl: 'https://www.almokhtabar.com/web/almokhtabar-lab/servicedetails?articleId=156145',
                          webViewTitle: 'معامل المختبر',
                        ));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)
                            ),
                            child: Image.asset('assets/images/elmoktbr.jpg',

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(' المختبر' ,style: TextStyle(color: Colors.black ,fontSize: 20),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 0),  // changes position of shadow
                        ),
                      ],
                    ),
                    height: 210,
                    width: 150,
                    child: InkWell(
                      onTap: ()
                      {
                        navigateTo(context, CoronaCheckLabsScreen(
                          appBarTitle: 'PCR Test Home',
                          pathImage: 'assets/images/pcrtesthome.png',
                          description: 'تحليل PCR عبارة عن مسحة من الأنف يمكن حجز زيارة منزلية، ويكون سعر التحليل 1100 جنيه بتوثيق ختم النسر و تظهر النتيجة خلال 24 ساعة , او 750 بتوثيق QR Code و تظهر النتيجة خلال 8 ساعات ، بالإضافة إلى 100 جنيه سعر الزيارة المنزلية .',
                          hotLine: 'الرقم الساخن 201069394520+',
                          webViewUrl: 'https://pcr-testhome.com/departments/1/view',
                          webViewTitle: 'PCR Test Home',
                        ));
                      } ,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)
                            ),
                            child: Image.asset('assets/images/pcrtesthome.png',

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text('PCR Test Home' ,style: TextStyle(color: Colors.black ,fontSize: 20),),
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



class CoronaCheckLabsScreen extends CoronaCheckScreen {

  @required final String appBarTitle ;
  @required  final String pathImage ;
  @required  final String description ;
  @required  final String hotLine ;
  @required  final String webViewUrl ;
  @required  final String webViewTitle ;

   CoronaCheckLabsScreen({
     this.appBarTitle,
     this.pathImage,
     this.description,
     this.hotLine,
     this.webViewUrl,
     this.webViewTitle,}
       );

  Widget build(BuildContext context)  => Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: Center(
            child: Text(
              appBarTitle,
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
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        backwardsCompatibility: false,
        backgroundColor: HexColor('#0A81AB'),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('#0A81AB'),
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 8,
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
      ),
      body: Center(
        child:Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 0),  // changes position of shadow
                      ),
                    ],
                  ),
                  
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                         Radius.circular(20),
                    ),
                    child: Image.asset(pathImage,
                      fit: BoxFit.fill,
                      width: 280,
                      height: 150,
                      

                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: Text(
                      description,
                      style: Theme.of(context).textTheme.subtitle1,
                      softWrap: true,
                      textAlign: TextAlign.center,


                    ),
                  ),
                ),
              ),
              Text(hotLine,
                style: Theme.of(context).textTheme.caption.copyWith(color: Colors.red),),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: defaultButton(function: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return WebViewScreen(webViewUrl , webViewTitle);
                  }));
                }, text: ('احجز الان')),
              )
            ],
          ),
        ),
      ),
    );
}