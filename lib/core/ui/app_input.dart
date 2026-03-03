import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'app_image.dart';

class AppInput extends StatefulWidget {
  final TextInputType? keyboardType;
  final bool isPassword;
  final VoidCallback? onPressed;
  final String? suffixIcon, prefixIcon;
  final double? bottomSpace;
  final TextEditingController? controller;
  final ValueChanged<String>? onCountryCodeChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final int maximumLines;
  final bool isrReadOnly;

  const AppInput({
    super.key,
    this.suffixIcon,
    this.prefixIcon,
    this.onPressed,
    this.keyboardType,
    this.isPassword = false,
    this.bottomSpace = 16,
    this.controller,
    this.onCountryCodeChanged,
    this.validator,
    this.hintText,
    this.maximumLines = 1,
    this.isrReadOnly = false,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomSpace ?? 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Expanded(
            child: TextFormField(
              readOnly: widget.isrReadOnly,
              maxLines: widget.maximumLines,
              controller: widget.controller,
              validator: widget.validator,
              maxLength: 10,
              keyboardType: widget.keyboardType,
              obscureText: widget.isPassword && isHidden,
              decoration: InputDecoration(
                filled: true,
                fillColor: whiteColor,
                counterText: "",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:borderColor),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: hintColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ),

                suffixIcon: widget.isPassword
                    ? Padding(
                        padding: EdgeInsets.all(12.r),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            iconColor,
                            BlendMode.srcIn,
                          ),
                          child: AppImage(
                            image: 'password_visibility.json',
                            bottomSpace: 0,
                            width: 20.w,
                            height: 20.h,
                            fit: BoxFit.scaleDown,
                            onLottieClicked: () {
                              isHidden = !isHidden;
                              setState(() {});
                            },
                          ),
                        ),
                      )
                    : widget.suffixIcon != null
                    ? Padding(
                        padding: EdgeInsets.all(16.r),
                        child: AppImage(
                          image: widget.suffixIcon!,
                          color: iconColor,
                          width: 18.w,
                          height: 18.h,
                        ),
                      )
                    : null,
                suffixIconColor: iconColor,

                prefixIcon: widget.prefixIcon != null
                ?Padding(
                  padding:  EdgeInsets.all(12.r),
                  child: AppImage(
                    image: widget.prefixIcon!,
                    width: 24,
                    height: 24,
                  ),
                ):null,
                prefixIconColor: iconColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
