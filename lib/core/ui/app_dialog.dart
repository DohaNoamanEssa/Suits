import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'package:suits/views/auth/sign_up.dart';
import 'package:suits/views/home/view.dart';
import 'app_button.dart';
import 'app_image.dart';

class AppDialog extends StatefulWidget {
  final bool isLogin;

  const AppDialog({super.key, this.isLogin = false});

  @override
  State<AppDialog> createState() => _DialogePageState();
}

class _DialogePageState extends State<AppDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: whiteColor,
      insetPadding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24.r)),
        padding: EdgeInsets.all(8.r),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppImage(
              image: "success.json",
              width: 101.w,
              height: 101.h,
              bottomSpace: 44.h,
            ),
            Text(
              widget.isLogin ? "Yeay! Welcome Back" : "Success",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0XFF101623),
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 8.h),

            Text(
              textAlign: TextAlign.center,
              widget.isLogin
                  ? 'Once again you login successfully\ninto medidoc app'
                  : 'Your account has been successfully\nregistered',
              style: TextStyle(
                color: Color(0XFFA1A8B0),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(height: 21.h),
            AppButton(
              width: 183,
              height: 56,

              buttonTitle: widget.isLogin ? "Go to home" : "Sign In",
              onPressed: () {
                (widget.isLogin)
                    ? goTo(HomeView(), canPop: false)
                    : goTo(SignUpView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
