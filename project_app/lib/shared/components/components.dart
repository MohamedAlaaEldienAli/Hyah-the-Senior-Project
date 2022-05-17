import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_app/modules/login_screen/hyah_login_screen.dart';
import 'package:project_app/modules/web_view/web_view_screen.dart';
import 'package:project_app/shared/network/local/cache_helper.dart';

Widget defaultButton(
        {double width = double.infinity,
        Color background = Colors.blue,
        bool isUpperCase = true,
        @required Function function,
        @required String text,
        BoxDecoration decoration}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: HexColor('#0A81AB'),
            spreadRadius: 3,
            blurRadius: 2,
            offset: Offset(0, 0),
          ),
        ],
      ),
      width: width,
      height: 45,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );

Widget defaultTextButton({
  @required Function function,
  @required String text,
   var style,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: style == null ?TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: HexColor('#0A81AB')): style,
      ),
    );

Widget defaultAppBar({
  @required BuildContext context,
  @required Function onPressed,
  String title,
  List<Widget> actions,
  Color backgroundColor,
}) =>
    AppBar(
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(Iconsax.arrow_right),
      ),
      title: Text(
        title,
      ),
      titleSpacing: 0,
      actions: actions,

      //backgroundColor: Theme.of(context).appBarTheme.systemOverlayStyle.statusBarColor,
    );

Widget defaultTextFormField({
  @required Function validate,
  @required TextEditingController controller,
  @required TextInputType type,
  @required String text,
}) =>
    TextFormField(
      controller: controller,
      validator: validate,
      keyboardType: type,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: text,
      ),
    );




Widget defaultFormField({
  @required Function validate,
  @required TextEditingController controller,
  @required TextInputType type,
  @required String label,
   String hintText,
  @required IconData prefix,
  IconData suffic,
  int maxLength,
  bool isPassword = false,
  Function suffixPressed,
  Function onTap,
  Function onChanged,
  bool isClickable = true,
}) =>
    TextFormField(
      maxLength:maxLength ,
      onChanged: onChanged,
      validator: validate,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onTap: onTap,
      enabled: isClickable,
      decoration: InputDecoration(


        hintText: hintText,
        counterText: "",
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffic != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffic))
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),

      ),
    );

void showToast({
  @required String message,
  @required ToastState state,
}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 4,
      backgroundColor: Colors.white,
      textColor: chooseToastColor(state),
      fontSize: 16.0);
}

enum ToastState {
  SUCCESS,
  ERROR,
  WARNING,
}

Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;

    case ToastState.ERROR:
      color = Colors.redAccent;
      break;

    case ToastState.WARNING:
      color = Colors.orangeAccent;
      break;
  }
  return color;
}

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        bottom: 10,
      ),
      child: Container(
        width: double.infinity,
        height: 2,
        color: Colors.grey,
      ),
    ); // l3ml fasel ben items

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void navigateAndFinish(context, widget) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      result: (Route<dynamic> route) => false,
    );

// void signOut(context) {
//   CacheHelper.removeData(
//     key: 'uId',
//   ).then((value) {
//     if (value) {
//       navigateAndFinish(
//         context,
//         HyahLoginScreen(),
//       );
//     }
//   });
// }

String uId = "";
