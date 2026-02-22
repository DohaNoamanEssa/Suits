import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';

import 'app_image.dart';
class AppArrowLeft extends StatelessWidget {
  const AppArrowLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: AlignmentDirectional.centerStart,
      child: Transform.rotate(
        angle: pi,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
                border: BoxBorder.all(
              width: 1,
            color: Color(0XFF4E6542)
          )
          ),
          child: CircleAvatar(
            radius: 25.r,
            backgroundColor: Colors.transparent,
            child: AppImage(image: "arrow_right.svg",color: primaryColor,width: 20.w,height: 20.h,),
          ),
        ),
      ),
    );
  }
}
