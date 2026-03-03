import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/views/home/pages/cart.dart';
import 'package:suits/views/home/pages/favourite.dart';
import 'package:suits/views/home/pages/home.dart';
import 'package:suits/views/home/pages/profile.dart';
import '../../core/ui/app_image.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final list = [
    _Model(icon: "home.svg", page:HomePage() ),
    _Model(icon: "cart.svg", page:CartPage() ),
    _Model(icon: "favourite.svg", page:FavouritePage() ),
    _Model(icon: "profile.svg", page: ProfilePage()),
  ];
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: list[currentIndex].page,
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0,
        unselectedFontSize: 0,

        items: List.generate(
          list.length,
              (index) => BottomNavigationBarItem(
            icon: AppImage(
              image: list[index].icon,
              width: 24.w,
              height: 24.h,
              color: Color(0XFF676767),
            ),
            activeIcon: AppImage(
              image: list[index].icon,
              width: 24.w,
              height: 24.h,
              color: Color(0XFFDD8560),
            ),
                label: "",
                backgroundColor:Color(0XFFF9F9F9),




          ),
        ),
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
      ),

    );
  }
}
class _Model {
  final String icon;
  final Widget page;

  _Model({required this.icon, required this.page});
}

