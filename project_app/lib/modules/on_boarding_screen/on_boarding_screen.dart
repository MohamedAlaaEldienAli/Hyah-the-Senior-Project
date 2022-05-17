
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_app/modules/login_screen/hyah_login_screen.dart';
import 'package:project_app/shared/components/components.dart';
import 'package:project_app/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class BoardingModel
{
  final String image;
  final String title;
  final String bode;

  BoardingModel(
      this.image,
      this.title,
      this.bode);
}

class OnBoardingScreen extends StatefulWidget {


  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List <BoardingModel> boarding = [
    BoardingModel(
      'assets/images/one.png',
        'حياة',
        'تطبيق يساعد علي الحد من خطر انتشار فيروس كورونا المستجد  '),
    BoardingModel(
     'assets/images/onboard_2.png',
        'الجواز الصحي',
        'خدمة متاحة من خلال التطبيق تؤكد أن الشخص قد أكمل جميع الجرعات الخاصة بلقاحفيروس كورونا (كوفيد-19) وأصبح "محصّن" ضد الفيروس -بإذن الله- ',),
    BoardingModel(
      'assets/images/onboard_3.png',
        'لـقاح كورونا',
        'خدمة تُمكِّن المستخدم من حجز مواعيد جرعات لقاح كورونا (كوفيد-19) بعد التأكد من أهليته',)

  ];

  var boardController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        actions: [
          defaultTextButton(
              function: (){
                navigateAndFinish(context,HyahLoginScreen());
              },
              text: 'skip',
          ),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          child: Column(
            children: [
              Expanded(

                child: PageView.builder(
                  controller: boardController,
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (int index)
                  {
                    if( index == boarding.length - 1)
                      {
                        setState(() {
                          isLast = true;
                        });
                      }
                    else
                      {
                        setState(() {
                          isLast = false;
                        });
                      }
                  },
                  itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                ),
              ),
              SizedBox(height: 40,),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: boardController,
                    count: boarding.length,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: HexColor('#0A81AB'),
                      dotHeight: 10,
                      expansionFactor: 3,
                      dotWidth: 15,
                      spacing: 5,
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: ()
                    {
                      if(isLast)
                        {
                          navigateAndFinish(context,HyahLoginScreen());
                        }
                      else
                        {
                          boardController.nextPage(
                            duration: Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.easeIn,);
                        }
                    },
                    child: Icon(Icons.keyboard_arrow_left ,color: Colors.white,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ) ,
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment:CrossAxisAlignment.start,
    children: [
      Expanded(child: Image.asset(model.image)),
      SizedBox(height: 10,),
      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).textTheme.bodyText1.color

        ),
      ),
      SizedBox(height: 15,),
      Text(
        '${model.bode}',
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).textTheme.caption.color

        ),
      ),
      SizedBox(height: 10,),

    ],
  );
}
