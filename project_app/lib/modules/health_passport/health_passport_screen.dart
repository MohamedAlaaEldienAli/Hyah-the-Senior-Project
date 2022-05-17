import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_app/layout/cubit/cubit.dart';
import 'package:project_app/shared/components/components.dart';

class HealthPassportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userModel = HyahCubit.get(context).userModel;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(
            child: Text(
          "الجواز الصحي",
          style: TextStyle(color: HexColor('#0A81AB'), fontSize: 26, shadows: [
            Shadow(
              offset: Offset(0, 2.0),
              blurRadius: 5.0,
              color: Colors.grey.withOpacity(0.4),
            ),
          ]),
        )),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(0),
          ),
        ),
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backwardsCompatibility: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).appBarTheme.backgroundColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
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
                color: HexColor('#0A81AB'),
              ),
            ),
          )
        ],
      ),
      body: ConditionalBuilder(
        condition: HyahCubit.get(context).userModel.vaccineImage != '' && HyahCubit.get(context).userModel.vaccineImage != null ,
        builder: (contex) => Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: HexColor('#0A81AB'),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          ),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              //HexColor('#f8f9fa'),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0, top: 14),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 38,
                              backgroundColor: Colors.grey,
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(
                                  '${userModel.image}',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Personal Information'),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'الأسم :  ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(color: Colors.black),
                                ),
                                Text('${userModel.name}',
                                    style: Theme.of(context).textTheme.caption),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  'النوع :  ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(color: Colors.black),
                                ),
                                Text('${userModel.gender}',
                                    style: Theme.of(context).textTheme.caption),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  'محل الأقامة :  ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(color: Colors.black),
                                ),
                                Text(
                                  '${userModel.city}',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  'رقم البطاقه :  ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(color: Colors.black),
                                ),
                                Text(
                                  '${userModel.cardId}',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: myDivider(),
                  ), // the Line
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Health Information'),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('COVID-19 Vaccine Details',
                                    style: Theme.of(context).textTheme.caption),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Pfizer-BioNtech',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(fontSize: 16)),
                                Column(
                                  children: [
                                    Text(
                                      'First Dose',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .copyWith(color: Colors.black),
                                    ),
                                    Text('20-9-2021',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('AstraZeneca',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(fontSize: 16)),
                                Column(
                                  children: [
                                    Text(
                                      'Second Dose',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .copyWith(color: Colors.black),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Text('7-10-2021',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: myDivider(),
                  ), // the Line
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('PCR Information'),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Image.asset(
                        'assets/images/medical-report.png',
                        height: 70,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        fallback: (context) => Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitPouringHourglass(
              color: HexColor('#0A81AB'),
              size: 50,
            ),
            SizedBox(
              height: 25,
            ),
            Text("الرجاء رفع صوره شهاده تطعيم كورونا"),
            SizedBox(
              height: 8,
            ),
            Text(
              "خدمات > الحالة الصحيه > الاختيرات  ",
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "والأنتظار 24 ساعه لحين ",
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              "أصدار الجواز",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        )),
      ),
    );
  }
}
