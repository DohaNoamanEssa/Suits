import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  bool isLoginClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: "Sign Up",),
      body: SafeArea(
        child: Form(
          key: formKey,
          onChanged: () {
            if (isLoginClicked) {
              formKey.currentState?.validate();
            }
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.all(13.0.r).copyWith(top: 103.h),
            child: Column(
              children: [
                AppInput(hintText: "Enter your name",prefixIcon: "",),
                AppInput(hintText: "Enter your email",prefixIcon: "",),
                AppInput(
                  keyboardType: TextInputType.visiblePassword,
                  hintText: "Enter your password",
                  controller: passwordController,
                  isPassword: true,
                  bottomSpace: 0,
                  validator: InputValidator.passwordValidator,
                ),
                Row(children: [],),
                SizedBox(height: 38.h,),
                AppButton(buttonTitle: "Sign Up",onPressed: (){
                  showDialog(context: context, builder: (context) => AppDialog(),);
                },),
                SizedBox(height: 32.h,),
                AppLoginOrRegister(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppLoginOrRegister(),
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
