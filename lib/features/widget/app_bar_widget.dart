import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loggy/core/color/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    this.actions,
    this.bottom,
    this.toolbarHeight=60,
  });

  final String title;
  final List<Widget>? actions;
  final double toolbarHeight;
  final PreferredSizeWidget? bottom;


  @override
  Size get preferredSize {
    final double? bottomHeight = bottom?.preferredSize.height;
    final height =
    bottomHeight == null ? toolbarHeight : bottomHeight + toolbarHeight;
    return Size(double.infinity, height);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 15, right: 25),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.arrow_back,
            size: 25,
          ),
        ),
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: actions ??
            [
              // StoreSvgButton(
              //   svg: "assets/icons/notification.svg",
              //   callback: () => context.push(Routes.notification),
              // )
            ],
        bottom: bottom,
      ),
    );
  }
}