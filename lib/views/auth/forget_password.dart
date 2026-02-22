import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'package:suits/core/ui/app_appbar.dart';
import 'package:suits/core/ui/app_button.dart';
import 'package:suits/core/ui/app_input.dart';
import 'package:suits/views/auth/otp.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text("Forgot Your Password?", style: styleOfTitle),
              ),
              SizedBox(height: 11.h),
              Text(
                "Enter your email or your phone number, we\nwill send you confirmation code",
                style: TextStyle(
                  color: Color(0XFFA1A8B0),
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 31.h),
              Row(
                children: [
                  Expanded(
                    child: AppButton(onPressed: () {}, buttonTitle: "Email"),
                  ),
                  Expanded(
                    child: AppButton(onPressed: () {}, buttonTitle: "Phone"),
                  ),

                  // Expanded(child: TextButton(onPressed: () {  }, child: Text(""),),
                ],
              ),
              SizedBox(height: 16.h),
              AppInput(
                hintText: "safiaayman@gmail.com",
                prefixIcon: "mail.svg",
              ),
              SizedBox(height: 16.h),

              AppButton(
                buttonTitle: "Reset Password",
                onPressed: () {
                  goTo(OTPView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
