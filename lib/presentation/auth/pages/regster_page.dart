import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_like/common/WIDGET/app%20bar/app_bar.dart';
import 'package:spotify_like/common/WIDGET/button/basicAppButton.dart';
import 'package:spotify_like/common/hleper/is_dark_mode.dart';
import 'package:spotify_like/core/configs/theme/app_Color.dart';
import 'package:spotify_like/core/configs/theme/asset/app_png.dart';
import 'package:spotify_like/core/configs/theme/asset/app_vector.dart';
import 'package:spotify_like/presentation/auth/pages/log_in.dart';
import 'package:spotify_like/presentation/auth/pages/regster.dart';

class RegsterPage extends StatelessWidget {
  const RegsterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDarkModeEnabled
          ? AppColor.darkBackground
          : AppColor.lightBackground,
      body: Stack(
        children: [
          // Background Decorations
          Align(
            alignment: const AlignmentDirectional(1, -1.4),
            child: Transform.rotate(
              angle: -1.5,
              child: SvgPicture.asset(
                AppVector.regsterUnion,
                height: 300.h,
                width: 300.w,
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(5.5, 1),
            child: Transform.rotate(
              angle: 7.9,
              child: SvgPicture.asset(
                AppVector.regsterUnion2,
                height: 280.h,
                width: 300.w,
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-.995, 1.1),
            child: Image.asset(
              AppPng.regsterBelle,
              height: 330.h,
              width: 250.w,
            ),
          ),

          // Foreground Content
          SingleChildScrollView(
            padding: EdgeInsets.all(20.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomAppBar(
                  title: Image.asset(AppPng.logo, width: 108.w, height: 33.h),
                  centerTitle: true,
                ),
                SizedBox(height: 100.h),
                Image.asset(AppPng.logo, width: 150.w, height: 50.h),
                SizedBox(height: 90.h),
                Text(
                  "Enjoy listening to music",
                  style: TextStyle(
                    fontFamily: "Satoshi",
                    fontWeight: FontWeight.bold,
                    color: context.isDarkModeEnabled
                        ? AppColor.grey
                        : AppColor.darkGrey,
                    fontSize: 26.sp,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Spotify is a proprietary Swedish audio streaming and media services provider",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Satoshi",
                    fontWeight: FontWeight.w400,
                    color: context.isDarkModeEnabled
                        ? AppColor.grey
                        : AppColor.darkGrey,
                    fontSize: 17.sp,
                  ),
                ),
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Basicappbutton(
                      btnHeight: 60.h,
                      btnWidth: 120.w,
                      btnColor: AppColor.primary,
                      btnText: 'Register',
                      btnTextColor: AppColor.lightBackground,
                      btnFontFamily: 'Satoshi',
                      btnFontWeight: FontWeight.normal,
                      btnFontSize: 19.sp,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Register(),
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 20.w),
                    Basicappbutton(
                      btnHeight: 60.h,
                      btnWidth: 120.w,
                      btnColor: context.isDarkModeEnabled
                          ? AppColor.darkBackground
                          : AppColor.lightBackground,
                      btnTextColor: context.isDarkModeEnabled
                          ? AppColor.lightBackground
                          : AppColor.darkBackground,
                      btnText: 'Login',
                      btnFontFamily: 'Satoshi',
                      btnFontWeight: FontWeight.normal,
                      btnFontSize: 19.sp,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LogIn(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
