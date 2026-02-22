import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'package:suits/core/ui/app_image.dart';

import 'on_boarding.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});


  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  initState() {
    super.initState();
    goTo(OnBoardingView(), delayInSeconds: 2,canPop: false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImage(image: "logo.png",width: 100.w,height: 100.h,),
              Text("suits",style: TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.w400,
                fontSize: 128.sp,
                fontFamily: "Waterfall",
                letterSpacing: .5,
                height: 1.5,
              ),),
            ],
          ),
        ),
      )
    );
  }
}
