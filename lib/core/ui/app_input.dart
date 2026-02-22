import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'app_image.dart';

class AppInput extends StatefulWidget {
  final TextInputType? keyboardType;
  final bool isPassword;
  final VoidCallback? onPressed;
  final String? suffixIcon,prefixIcon;
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
    this.maximumLines=1,
    this.isrReadOnly=false,
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
                fillColor: Color(0XFFF9FAFB),

                counterText: "",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0XFFE5E7EB),
                  ),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0XFFE5E7EB),
                  ),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: Color(0XFFA1A8B0),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),

                suffixIcon: widget.isPassword
                    ? Padding(
                        padding: EdgeInsets.all(12.r),
                        child: AppImage(
                          color: hintColor,
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
                      )
                    : widget.suffixIcon != null
                    ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: AppImage(image: widget.suffixIcon!,color: iconsColor, width: 18, height: 18),
                    )
                    : null,
                suffixIconColor: iconsColor,

                prefixIcon:
                   AppImage(image: widget.prefixIcon!, width: 24, height: 24),
                prefixIconColor: Color(0XFFA1A8B0),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
