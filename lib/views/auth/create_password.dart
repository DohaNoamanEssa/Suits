import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'package:suits/core/ui/app_appbar.dart';
import 'package:suits/core/ui/app_button.dart';
import 'package:suits/core/ui/app_dialog.dart';
import 'package:suits/core/ui/app_input.dart';
import 'package:suits/views/auth/otp.dart';

class CreatePasswordView extends StatelessWidget {
  const CreatePasswordView({super.key});

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
                child: Text("Create New Password", style: styleOfTitle),
              ),
              SizedBox(height: 8.h),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Create your new password to login",
                  style: TextStyle(
                    color: Color(0XFFA1A8B0),
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 24.h),

              AppInput(isPassword: true, prefixIcon: "mail.svg"),
              AppInput(
                isPassword: true,
                prefixIcon: "mail.svg",
                hintText: "Enter your password",
              ),
              SizedBox(height: 8.h),
              AppButton(
                buttonTitle: "Create Password",
                onPressed: () {
                  showDialog(context: context, builder: (context) => AppDialog(),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
