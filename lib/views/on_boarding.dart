import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'package:suits/core/ui/app_arrow_left.dart';
import '../core/ui/app_arrow_right.dart';
import '../core/ui/app_image.dart';
import 'auth/login.dart';
import 'custom_on_boarding.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardindViewState();
}

class _OnBoardindViewState extends State<OnBoardingView> {
  final list = [
    _Model(
      imgURL:
          "https://i.pinimg.com/736x/36/ed/13/36ed130b0ed337ce43f23e452fda9913.jpg",
      title: "Welcome To\nFashion",
      subTitle:
          "Discover the latest trends and exclusive styles\nfrom our top designers",
    ),
    _Model(
      imgURL:
          "https://i.etsystatic.com/26526080/r/il/0058ca/5240987737/il_570xN.5240987737_c98e.jpg",
      title: "Explore & Shop",
      subTitle:
          "Discover a wide range of fashion categories,\nbrowse new arrivals and shop your favourites",
    ),
    _Model(
      imgURL:
          "https://i.pinimg.com/originals/5c/81/f7/5c81f7544b69f97a00b06c62c865bb30.jpg",
      title: "Hi,Shop Now",
      subTitle: "",
    ),

  ];
  int currentIndex = 0;
  int lastIndex = 2;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    bool isLast = currentIndex == lastIndex;
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: PageView.builder(
          controller: _pageController,
          itemCount: list.length,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            final item = list[index];
            return Stack(
              children: [
                AppImage(
                  image: item.imgURL,
                  fit: BoxFit.cover,
                  width: screenWidth,
                  height: screenHeight,
                ),
                Padding(
                  padding: EdgeInsets.all(24.r),
                  child: (currentIndex == 0 || currentIndex == 1)
                      ? Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: TextButton(
                            onPressed: () {
                              goTo(LoginView(), canPop: false);
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: blackColor,
                              side: BorderSide(color: blackColor, width: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 10,
                              ),
                            ),
                            child: Text(
                              "Skip",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ),
                        )
                      : Text(""),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: Container(
          height: 300,
          padding: EdgeInsets.all(14.0),
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                list[currentIndex].title,
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Arial",
                ),
              ),
              SizedBox(height: 18.h),
              Text(
                list[currentIndex].subTitle,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: whiteColor,
                  fontFamily: "Arial",
                ),
              ),
              Spacer(),
              Container(
                color: Colors.transparent,
                height: 80,
                padding: EdgeInsets.only(bottom: 30, right: 14, left: 14),
                child: Row(
                  children: [
                    if (currentIndex != 0 && currentIndex != lastIndex)
                      GestureDetector(
                        onTap: () {
                          if (currentIndex < lastIndex) {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            goTo(LoginView(), canPop: false);
                          }
                        },
                        child: AppArrowLeft(),
                      ),

                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        list.length,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          width: currentIndex == index ? 15 : 10,
                          height: currentIndex == index ? 15 : 10,
                          decoration: BoxDecoration(
                            color: currentIndex == index
                                ? Color(0XFFDD8560)
                                : Color(0XFFD9D9D9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),

                    GestureDetector(
                      onTap: () {
                        if (currentIndex < lastIndex) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                       else if (isLast) {
                          goTo(CustomOnBoardingView());
                        }
                        else {
                          goTo(LoginView(), canPop: false);
                        }
                      },
                      child: AppArrowRight(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // bottomNavigationBar:
      ),
    );
  }
}

class _Model {
  final String imgURL;
  final String title;
  final String subTitle;

  _Model({required this.imgURL, required this.title, required this.subTitle});
}

