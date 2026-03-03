import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'package:suits/core/ui/app_appbar.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_otp.dart';
import '../../core/ui/app_resend_otp.dart';

class OTPView extends StatefulWidget {
  final bool isForgetPassword;

  const OTPView({super.key, this.isForgetPassword = false});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  _OTPViewState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(14.0.r),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Enter Verification Code", style: styleOfTitle)),
              SizedBox(height: 8.h),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff8E8EA9),
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: 'Enter code that we have sent to your\nnumber ',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Color(0xff8E8EA9),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: '08528188***',
                        style: TextStyle(
                          height: 2.4.h,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: Color(0xff434C6D),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 33.h),
              AppOTP(),
              SizedBox(height: 31.h,),

              AppButton(buttonTitle: "Verify", onPressed: () {}),
              SizedBox(height: 8.h,),
              AppResendOTP(),
            ],
          ),
        ),
      ),
    );
  }
}
