import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';

class AppResendOTP extends StatefulWidget {
  const AppResendOTP({super.key});

  @override
  State<AppResendOTP> createState() => _AppResendOTPState();
}

class _AppResendOTPState extends State<AppResendOTP> {
  bool isSent = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal:30.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(
            "Didn’t receive a code?",
            style: TextStyle(
              color: Color(0XFF717784),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextButton(
            onPressed: isSent
                ? null
                : () {
                    isSent = true;
                    setState(() {});
                  },
            child: Text(
              "Resend",
              style: TextStyle(
                color: isSent
                    ? Colors.grey
                    : primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Spacer(),
          if (isSent)
            CircularCountDownTimer(
              width: 50,
              height: 40,
              duration: 5,
              fillColor: Colors.transparent,
              ringColor: Colors.transparent,
              isReverse: true,
              textFormat: CountdownTextFormat.MM_SS,
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xff8E8EA9),
                fontSize: 12.sp,
              ),
              onComplete: () {
                isSent = false;
                setState(() {});
              },
            ),
        ],
      ),
    );
  }
}
