import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/logic/helper_methods.dart';
import 'package:suits/core/ui/app_button.dart';
import 'package:suits/core/ui/app_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final list = ["All", "Newest", "Popular", "Men", "Women"];
  final lists = [listAll, listNewest, listPopular, listMen, listWomen];

 static final listAll= [
    "https://avatars.mds.yandex.net/i?id=25ca82045cd696b50fa8f387817fba8136b87db9-9198174-images-thumbs&n=13",
    "https://avatars.mds.yandex.net/get-znatoki/1449939/2a0000017d38274be19df38735c8c10ae1ea/orig",
    "https://i.pinimg.com/736x/69/51/60/695160ee05aa685412cf2dea725361f4.jpg",
    "https://cs1.livemaster.ru/storage/c2/94/05a9a93ec9869fb37c58d044b6ap--materialy-dlya-tvorchestva-sherst-s-shelkom-italiya.jpg",
  ];
 static final listNewest= [
    "https://avatars.mds.yandex.net/get-znatoki/1449939/2a0000017d38274be19df38735c8c10ae1ea/orig",
    "https://i.pinimg.com/736x/69/51/60/695160ee05aa685412cf2dea725361f4.jpg",
  ];
  static final listPopular= [
    "https://avatars.mds.yandex.net/i?id=25ca82045cd696b50fa8f387817fba8136b87db9-9198174-images-thumbs&n=13",
    "https://cs1.livemaster.ru/storage/c2/94/05a9a93ec9869fb37c58d044b6ap--materialy-dlya-tvorchestva-sherst-s-shelkom-italiya.jpg",
  ];
  static  final listMen= [
    "https://avatars.mds.yandex.net/i?id=25ca82045cd696b50fa8f387817fba8136b87db9-9198174-images-thumbs&n=13",
    "https://avatars.mds.yandex.net/get-znatoki/1449939/2a0000017d38274be19df38735c8c10ae1ea/orig",
   ];
  static final listWomen= [
    "https://i.pinimg.com/736x/69/51/60/695160ee05aa685412cf2dea725361f4.jpg",
    "https://cs1.livemaster.ru/storage/c2/94/05a9a93ec9869fb37c58d044b6ap--materialy-dlya-tvorchestva-sherst-s-shelkom-italiya.jpg",
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.all(16.r),
          child: Text("Hello Safia"),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: whiteColor,
              child: AppImage(image: "bell.svg", width: 20.w, height: 20.h),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 328.w,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(16.r),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "New Collection",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              color: blackColor,
                            ),
                          ),
                          SizedBox(height: 5.h),

                          Text(
                            "Disscount 50% for\nthe first transaction",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: hintColor,
                            ),
                          ),
                          SizedBox(height: 18.h),
                          AppButton(buttonTitle: "Shop Now", onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: AppImage(
                      image: "clothes.png",
                      width: 110.w,
                      height: 104.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 28.h),
            Row(
              children: [
                Text(
                  "Categary",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Montserrat",
                  ),
                ),
                Spacer(),
                Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Montserrat",
                  ),
                ),
              ],
            ),
            SizedBox(height: 18.h),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 25,
                children: [
                  Category(image: "bell.svg", title: "Blazar"),
                  Category(image: "bell.svg", title: "Shirt"),
                  Category(image: "bell.svg", title: "Men Shoes"),
                  Category(image: "bell.svg", title: "Women Shoes"),
                ],
              ),
            ),
            SizedBox(height: 35.h),
            Text(
              "Flash Sale",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                fontFamily: "Montserrat",
              ),
            ),
            SizedBox(height: 40.h),
            SingleChildScrollView(
              child: SizedBox(
                height: 45.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return AppButton(
                      onPressed: () {
                        selectedIndex = index;
                        setState(() {});
                      },
                      buttonTitle: list[index],
                      buttonColor: selectedIndex == index
                          ? primaryColor
                          : whiteColor,
                      fontColor: selectedIndex == index
                          ? whiteColor
                          : blackColor,
                      width: 0,
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 8.w),
                  itemCount: list.length,
                ),
              ),
            ),
            SizedBox(height: 39),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 22,
                crossAxisSpacing: 22,
              ),
              itemBuilder: (context, index) {
                // String whichlist=lists[selectedIndex];
                return ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: AppImage(image:lists[selectedIndex][index] , width: 149.w, height: 140.h,fit: BoxFit.fitWidth,));
              },
              itemCount: lists[selectedIndex].length,
            ),
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: primaryColor, width: 1),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.r),
            child: AppImage(image: image),
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12.sp,
            color: Color(0XFF676767),
          ),
        ),
      ],
    );
  }
}
