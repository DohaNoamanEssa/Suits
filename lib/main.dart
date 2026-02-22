import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/views/auth/create_password.dart';
import 'package:suits/views/auth/forget_password.dart';
import 'package:suits/views/auth/login.dart';
import 'package:suits/views/auth/otp.dart';
import 'package:suits/views/custom_on_boarding.dart';
import 'package:suits/views/on_boarding.dart';
import 'package:suits/views/splash.dart';
import 'core/logic/helper_methods.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360.0, 800.0),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return MaterialApp(
          color: Color(0XFFF4F5F7),
          navigatorKey: navKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Color(0XFFDD8560),
            fontFamily: "Inter",
            textTheme: TextTheme(
              displaySmall: TextStyle(color: Color(0XFF000000)),
              displayLarge: TextStyle(color: Color(0XFF000000)),
              displayMedium: TextStyle(color: Color(0XFF000000)),
            ),
            appBarTheme: AppBarTheme(
              centerTitle: true,
              titleTextStyle: TextStyle(
                color: Color(0XFF101623),
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          home: CreatePasswordView(),
        );
      },
    );
  }
}
