import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_app/modules/services/services_screen.dart';
import 'package:project_app/shared/components/components.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class PermissionsScreen extends StatelessWidget {

  PermissionsScreen({Key key, this.title}) : super(key: key);
  final String title;

  final List<Widget> fancyCards = [
    FancyCard(
      image: Image.asset("assets/images/Persk-bro.png"),
      title: "تصاريح داخليه",


    ),
    FancyCard(
      image: Image.asset("assets/images/Coronavir-amico.png"),
      title: "تصاريح تنقل بين المدن",


    ),

  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(
            child: Text(
              "التصاريح",
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
      body: StackedCardCarousel(
        items: fancyCards,
        type: StackedCardCarouselType.fadeOutStack,
      ),
    );
  }

}

class FancyCard extends StatelessWidget {
  const FancyCard({
    Function onPageChanged,
    this.subTitle,
    this.image,
    this.title,
  }) ;

  final Image image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          Container(
            width: 350,
            height: 300,
            child: image,
            key: ValueKey('kjhgjk1'),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 15,
          ),

          OutlineButton(
            child: const Text("طلب تصريح"),
            onPressed: (){
              ScaffoldMessenger.of(context)
                  .showSnackBar(
                const SnackBar(
                  content: Text(
                    'تم طلب تصريح الرجاء الأنتظار لحين الموافقه',
                    style: TextStyle(fontSize: 16),
                  ),
                  backgroundColor: Colors.deepOrange,
                ),
              );

            },

          ),

        ],
      ),
    );
  }
}
