import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_app/layout/cubit/cubit.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class QrCodeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var userModel = HyahCubit.get(context).userModel;
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title: Center(
            child: Text(
              "QR Code",
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SfBarcodeGenerator(
            value: 'ID Number = ${userModel.cardId} , DateBirth = ${userModel.dateBirth} , Gender = ${userModel.gender} ',
            symbology: QRCode(),
            showValue: false,
            barColor: Theme.of(context).textTheme.subtitle1.color,
          ),
        ),
      ),
    );
  }
}
