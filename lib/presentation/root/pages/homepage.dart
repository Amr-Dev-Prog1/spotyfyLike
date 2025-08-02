import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_like/common/WIDGET/app%20bar/app_bar.dart';
import 'package:spotify_like/core/configs/theme/app_Color.dart';
import 'package:spotify_like/core/configs/theme/asset/app_png.dart';
import 'package:spotify_like/core/configs/theme/asset/app_vector.dart';
import 'package:spotify_like/presentation/root/pages/widget/category_selector%20.dart';
import 'package:spotify_like/presentation/root/pages/widget/home_paner.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomAppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(
                  Icons.search_rounded,
                  color: AppColor.darkGrey,
                  size: 30,
                ),
                onPressed: () {
                  // Handle menu button press
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.more_vert_rounded,
                    color: AppColor.darkGrey,
                    size: 30,
                  ),
                  onPressed: () {
                    // Handle notifications button press
                  },
                ),
              ],
              title: Image.asset(AppPng.logo, width: 140, height: 50),
              centerTitle: true,
            ),

            HomePaner(),
            Column(
              children: [
                SizedBox(height: 200.h),
                CategorySelector(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
