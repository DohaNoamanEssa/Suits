import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../logic/helper_methods.dart';

class AppOTP extends StatelessWidget {
  const AppOTP({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      cursorColor: primaryColor,
      cursorHeight: 16.h,
      cursorWidth: 5.w,
      hintCharacter: " ",
      mainAxisAlignment: MainAxisAlignment.center,
      separatorBuilder: (builder, context) => SizedBox(width: 23.w),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10.0.r),
        inactiveColor: whiteColor,
          activeColor: primaryColor,
        selectedColor: primaryColor,
        fieldHeight: 64.h,
        fieldWidth: 64.w,
        borderWidth: 1.5,
        errorBorderColor: Colors.red,

      ),
    );
  }
}
