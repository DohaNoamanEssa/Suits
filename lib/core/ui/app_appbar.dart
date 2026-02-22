import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_image.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isCenter;
  final List<Widget>? list;
  final Color? bgColor;

  const AppAppBar({
    super.key,
    this.title = "",
    this.isCenter = true,
    this.list,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    double scale = 1.5;

    return AppBar(
      title: Text(title),
      centerTitle: isCenter,
      elevation: 0,
      backgroundColor: bgColor ?? Colors.transparent,
      leading: IconButton(
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minWidth: 24.w * scale,
          minHeight: 24.h * scale,
        ),
        icon: AppImage(
          image: "arrow_back.svg",
          color: const Color(0xFF101623),
          width: 24.w * scale,
          height: 24.h * scale,
        ),
      ),
      actions: list,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
