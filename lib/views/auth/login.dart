import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/ui/app_button.dart';
import 'package:suits/core/ui/app_dialog.dart';
import 'package:suits/core/ui/app_input.dart';
import 'package:suits/core/ui/app_login_or_register.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/ui/app_appbar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: "Login"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(18.r),
          child: Column(
            children: [
              Text(
                "Hi Welcome back, you’ve been missed",
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 39.h),
              AppInput(hintText: "Enter your email", prefixIcon: "mail.svg"),
              AppInput(
                hintText: "Enter your password",
                prefixIcon: "mail.svg",
                suffixIcon: "password_visibility.json",
                bottomSpace: 0,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 13.w,
                    top: 12.h,
                    bottom: 22.h,
                  ),
                  child: TextButton(
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),
                    onPressed: () {
                      // goTo(ForgetPasswordView(), canPop: true);
                    },
                  ),
                ),
              ),
              AppButton(buttonTitle: "Sign In", onPressed: () {
                showDialog(context: context,
                  builder: (context) => AppDialog(isLogin: true,),
                );
              }),
              AppLoginOrRegister(isLogin: true),
              SizedBox(height: 21.h),
              Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Text(
                      "OR",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0XFFA1A8B0),
                      ),
                    ),
                  ),
                  Divider(color: Color(0XFFE5E7EB), thickness: 1),
                ],
              ),
              SizedBox(height: 30.h),
              AppButton(
                isIcon: true,
                buttonTitle: "Sign in with google",
                prefixIcon: "google.svg",
                onPressed: () {},
              ),AppButton(
                isIcon: true,
                buttonTitle: "Sign in with Apple",
                prefixIcon: "apple.svg",
                onPressed: () {},
              ),AppButton(
                isIcon: true,
                buttonTitle: "Sign in with Facebook",
                prefixIcon: "facebook.svg",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
