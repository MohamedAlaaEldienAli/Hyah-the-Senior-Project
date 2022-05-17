import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_app/modules/services/services_screen.dart';
import 'package:project_app/shared/components/components.dart';
import 'package:webview_flutter/webview_flutter.dart';



class WebViewScreen extends StatelessWidget {
  final String url;
  final String title;

  WebViewScreen(this.url, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(
            child: Text(
              title,
          style: TextStyle(color: Colors.white, fontSize: 22, shadows: [
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
        toolbarHeight: 80,
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

      body: WebviewScaffold(

        url:url,
        withZoom: true,
        // السماح LocalStorage
        withLocalStorage: true,
        // السماح بتنفيذ كود js
        withJavascript: true,
          supportMultipleWindows: true,
      ),

      // WebView(
      //   initialUrl: url,
      // ),
    );
  }
}
