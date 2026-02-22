import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'package:suits/core/ui/app_image.dart';


class AppButton extends StatelessWidget {
  final String buttonTitle;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  final String prefixIcon;
  final bool isIcon, isLoading;
  final double? width,height;

  const AppButton({
    super.key,
    this.buttonColor,
    this.onPressed,
    this.prefixIcon = "",
    this.isIcon = false,
    this.isLoading = false,
    required this.buttonTitle,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding:  EdgeInsets.only(bottom: 16.0),
      child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor:buttonColor ??( (isIcon)? whiteColor: primaryColor) ,
                minimumSize: Size(width ?? 326.w,height?? 56.h),
              ),
              onPressed: onPressed,
              child:(isIcon)?
              Row(children: [
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: AppImage(image: prefixIcon,width: 30.w,height: 30.h,),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                        textAlign: TextAlign.center,
                        buttonTitle,  style:TextStyle(
                      color: blackColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    )),
                  ),
                ),


        ],)

                  : Text(
                buttonTitle,
                style:TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
    );
  }
}
