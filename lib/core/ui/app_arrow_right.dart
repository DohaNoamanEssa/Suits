import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/helper_methods.dart';
import 'app_image.dart';
class AppArrowRight extends StatelessWidget {
  const AppArrowRight({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: AlignmentDirectional.centerStart,
      child: CircleAvatar(
        radius: 25.r,
        backgroundColor:primaryColor,
        child: AppImage(image: "arrow_right.svg",color: whiteColor,width: 20.w,height: 20.h,),

      ),
    );
  }
}
