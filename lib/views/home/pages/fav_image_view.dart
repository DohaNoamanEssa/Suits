import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/ui/app_image.dart';

import '../../../core/logic/helper_methods.dart';

class FavImageView extends StatefulWidget {
  final String image, style, details;
  final double rate;
  final List colors, sizes;

  const FavImageView({
    super.key,
    required this.image,
    required this.style,
    required this.details,
    required this.colors,
    required this.sizes,
    required this.rate,
  });

  @override
  State<FavImageView> createState() => _FavImageViewState();
}

class _FavImageViewState extends State<FavImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      body: Stack(
        children: [
          AppImage(
            image: widget.image,
            fit: BoxFit.cover,
            width: screenWidth,
            height: screenHeight,
          ),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: AppImage(
                image: "arrow_back.svg",
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
        child: Container(
          width: double.infinity,
          height: 375.h,
          decoration: BoxDecoration(color: Color(0XFFF4F5F7)),
        ),
      ),
    );
  }
}
