import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/ui/app_button.dart';
import 'package:suits/views/auth/login.dart';

import '../core/logic/helper_methods.dart';
import '../core/ui/app_image.dart';

class CustomOnBoardingView extends StatelessWidget {
  const CustomOnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: newColor(#F4F5F7),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(45.r),
                      child: AppImage(
                        image:
                            "https://i.pinimg.com/originals/5c/81/f7/5c81f7544b69f97a00b06c62c865bb30.jpg",
                        width: 137.w,
                        height: 370.h,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Spacer(),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(45.r),

                          child: AppImage(
                            image:
                                "https://i.pinimg.com/736x/9a/ed/40/9aed403c04000924ded0f5e323c24a99.jpg",
                            width: 137.w,
                            height: 214.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 23.h),
                        ClipRRect(
                          // borderRadius: BorderRadius.circular(45.r),
                          child: AppImage(
                            isCircle: true,
                            image:
                                "https://avatars.mds.yandex.net/i?id=1dc7a1ddc2269e7144897066717d05e36673115b-4055204-images-thumbs&n=13",
                            width: 141.w,
                            height: 133.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 34),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "The ",
                      style: TextStyle(
                        color: Color(0XFF000000),
                        fontFamily: "Montserrat",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: "Suits App ",
                      style: TextStyle(
                        color: Color(0XFFDD8560),
                        fontFamily: "Montserrat",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: "that\nMakes Your Look Your Best",
                      style: TextStyle(
                        color: Color(0XFF000000),
                        fontFamily: "Montserrat",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),
              Text(
                "Everything you need in the world\nof fashion, old and new",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff727272),
                  fontFamily: "Montserrat",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 61),
              AppButton(onPressed: () {
                goTo(LoginView(),canPop: false);
              }, buttonTitle: "Get started"),
            ],
          ),
        ),
      ),
    );
  }
}
