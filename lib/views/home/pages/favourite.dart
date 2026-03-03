import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/ui/app_appbar.dart';
import 'package:suits/views/home/pages/fav_image_view.dart';

import '../../../core/logic/helper_methods.dart';
import '../../../core/ui/app_button.dart';
import '../../../core/ui/app_image.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  final list = ["All", "Blazar", "Shirt", "Pant", "Shoes"];

  final listAll = <Model>[
    Model(
      image:
          'https://i.pinimg.com/originals/a5/ff/57/a5ff571771af3b650c0d3ebf792a4c04.jpg',
      title: 'classic blazar',
      price: '83.97',
      rate: 4.9,
      category: "Blazar",
      description: 'cotton sweat shirt with a text point',
    ),
    Model(
      image:
          'https://i.etsystatic.com/26526080/r/il/0058ca/5240987737/il_570xN.5240987737_c98e.jpg',
      title: 'classic blazar',
      price: '83.97',
      rate: 4.9,
      category: "Blazar",
      description: 'cotton sweat shirt with a text point',

    ),
    Model(
      image:
          'https://avatars.mds.yandex.net/i?id=25ca82045cd696b50fa8f387817fba8136b87db9-9198174-images-thumbs&n=13',
      title: 'classic blazar',
      price: '83.97',
      rate: 4.9,
      category: "Blazar",
      description: 'cotton sweat shirt with a text point',

    ),
    Model(
      image:
          'https://avatars.mds.yandex.net/get-znatoki/1449939/2a0000017d38274be19df38735c8c10ae1ea/orig',
      title: 'classic blazar',
      price: '83.97',
      rate: 4.9,
      category: "Blazar",
      description: 'cotton sweat shirt with a text point',

    ),
    Model(
      image:
          'https://cdn.shopify.com/s/files/1/0029/1887/5193/files/grey_suit_black_shirt_on_a_mannequin_with_texture_and_patterns_480x480.jpg?v=1730407475',
      title: 'classic blazar',
      price: '83.97',
      rate: 4.9,
      category: "Blazar",
      description: 'cotton sweat shirt with a text point',

    ),
    Model(
      image:
          'https://avatars.mds.yandex.net/i?id=25ca82045cd696b50fa8f387817fba8136b87db9-9198174-images-thumbs&n=13',
      title: 'classic blazar',
      price: '83.97',
      rate: 4.9,
      category: "Blazar",
      description: 'cotton sweat shirt with a text point',

    ),
  ];

  int selectedIndex = 0;

  List<Model> get filteredList {
    if (selectedIndex == 0) {
      return listAll; // All
    } else {
      return listAll
          .where((item) => item.category == list[selectedIndex])
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: "My Wishlist"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
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
            SizedBox(height: 32.h),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 151 / 189,
              ),
              itemBuilder: (context, index) {
                return _Item(model: filteredList[index]);
              },
              itemCount: filteredList.length,
            ),
          ],
        ),
      ),
    );
  }
}

class Model {
  final String image, title, price, category, description;
  final double rate;
  final List<Color> colors=[Color(0XFF4E6542),Color(0XFF323232),Color(0XFFC11D1D),Color(0XFF979696),];
  final  sizes=['S','M','L','XL','XXL'];

  Model({
    required this.image,
    required this.title,
    required this.price,
    required this.rate,
    required this.category,
    required this.description,
  });
}

class _Item extends StatelessWidget {
  final Model model;

  const _Item({required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: GestureDetector(
                    onTap: () {
                      goTo(
                        FavImageView(
                          image: model.image,
                          style: model.category,
                          details: model.description,
                          colors: model.colors,
                          sizes: model.sizes,
                          rate: model.rate,
                        ),
                      );
                    },
                    child: AppImage(
                      image: model.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    model.title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                      fontFamily: "Montserrat",
                    ),
                  ),
                  Spacer(),
                  AppImage(
                    image: "star.svg",
                    width: 15.w,
                    height: 15.h,
                    color: Colors.amber,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    "${model.rate}",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0XFF979696),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ],
              ),

              Text(
                "\$ ${model.price}",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0XFFAB94A6),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0.r),
          child: Align(
            alignment: AlignmentDirectional.topEnd,
            child: CircleAvatar(
              backgroundColor: Color(0XFFFFFFFF).withValues(alpha: .5),
              child: AppImage(image: "favourite.svg", color: primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
