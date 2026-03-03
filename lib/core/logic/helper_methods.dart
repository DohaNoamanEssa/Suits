import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final navKey = GlobalKey<NavigatorState>();
final primaryColor=Color(0XFFDD8560);
final whiteColor=Color(0XFFFFFFFF);
final blackColor=Color(0XFF000000);
final iconColor=Color(0XFFA1A8B0);
final hintColor=Color(0XFFA1A8B0);
final borderColor=Color(0XFFE5E7EB);
final screenWidth=360.w;
final screenHeight=800.h;



final styleOfTitle= TextStyle(
  color: Color(0XFF101623),
  fontWeight: FontWeight.w700,
  fontSize: 24.sp,

);

void goTo(Widget page, {bool canPop = true, int? delayInSeconds}) {
  void action() {
    Navigator.pushAndRemoveUntil(
      navKey.currentContext!,
      MaterialPageRoute(builder: (context) => page),
      (route) => canPop,
    );
  }

  if (delayInSeconds != null) {
    Timer(Duration(seconds: delayInSeconds), () {
      action();
    });
  } else {
    action();
  }
}

void showMsg(String? msg, {bool isError = false}) {
  if (msg != null && msg.isNotEmpty) {
    ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 3),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }
}

Color newColor( Symbol color,){
  String myColor=color.toString();
  String cleanColor = myColor.replaceAll('Symbol("', '').replaceAll('")', '');
  int colorValue = int.parse("0xFF$cleanColor");


  return Color(colorValue);

}
