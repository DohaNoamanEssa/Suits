import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'package:suits/core/ui/app_dialog.dart';
import '../../core/logic/input_validator.dart';
import '../../core/ui/app_appbar.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_input.dart';
import '../../core/ui/app_login_or_register.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String? selectedCountryCode;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isSignUpClicked = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: "Sign Up"),
      body: SafeArea(
        child: Form(
          key: formKey,
          onChanged: () {
            if (isSignUpClicked) {
              formKey.currentState?.validate();
            }
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.all(13.0.r),
            child: Column(
              children: [
                AppInput(hintText: "Enter your name", prefixIcon: "user.svg"),
                AppInput(hintText: "Enter your email", prefixIcon: "mail.svg"),
                AppInput(
                  keyboardType: TextInputType.visiblePassword,
                  hintText: "Enter your password",
                  controller: passwordController,
                  isPassword: true,
                  prefixIcon: "lock.svg",
                  validator: InputValidator.passwordValidator,
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 25 / 18,
                      child: Checkbox(
                        value: isChecked,
                        fillColor: WidgetStateProperty.resolveWith<Color>((
                          states,
                        ) {
                          if (states.contains(WidgetState.selected)) {
                            return primaryColor;
                          }
                          return whiteColor;
                        }),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        checkColor: whiteColor,
                        side: BorderSide(color: Color(0XFFD9D9D9), width: 1.w),

                        onChanged: (bool? newVal) {
                          isChecked = newVal!;
                          setState(() {});
                        },
                      ),
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "I agree to the medidoc ",
                              style: TextStyle(
                                color: Color(0XFF3B4453),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.4,

                              ),
                            ),
                            TextSpan(
                              text: "Terms of Service\n",
                              style: TextStyle(
                                color: Color(0XFFDD8560),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.4,

                              ),
                            ),
                            TextSpan(
                              text: "and ",
                              style: TextStyle(
                                color: Color(0XFF3B4453),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.4,

                              ),
                            ),
                            TextSpan(
                              text: " Privacy Policy",
                              style: TextStyle(
                                color: Color(0XFFDD8560),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 38.h),
                AppButton(
                  buttonTitle: "Sign Up",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AppDialog(isLogin: false,),
                    );
                  },
                ),
                SizedBox(height: 32.h),
                AppLoginOrRegister(isLogin: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserData {
  late final String token;
  late final UserModel user;

  UserData.fromJson(Map<String, dynamic> json) {
    token = json['token'] ?? "";
    user = UserModel.fromJson(json['user']);
  }
}

class UserModel {
  late final int id;
  late final String username;
  late final String email;
  late final String phoneNumber;
  late final String countryCode;
  late final String role;
  late final String profilePhotoUrl;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    username = json['username'] ?? "";
    email = json['email'] ?? "";
    phoneNumber = json['phoneNumber'] ?? "";
    countryCode = json['countryCode'] ?? "";
    role = json['role'] ?? "";
    profilePhotoUrl = json['profilePhotoUrl'] ?? "";
  }
}
