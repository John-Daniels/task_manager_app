import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/assets_constant.dart';
import '../../../ui/theme/app_colors.dart';
import '../../modules/home/controllers/home_controller.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          Image.asset(
            Assets.accountPic,
            width: 30,
            height: 30,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 6.w),
          Column(
            children: [
              // Text(
              //   '${DateTime.now()}',
              //   style: TextStyle(
              //     fontSize: 9.sp,
              //     color: AppColors.lightGrey2,
              //   ),
              // ),
              Text(
                'Hi, ${controller.user.firstName}',
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.bell),
        ),
        IconButton(
          onPressed: controller.logoutUser,
          icon: Icon(
            Icons.logout,
            color: Colors.red[400],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
