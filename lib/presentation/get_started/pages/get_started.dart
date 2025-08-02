import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_like/common/WIDGET/button/basicAppButton.dart';
import 'package:spotify_like/common/hleper/is_dark_mode.dart';
import 'package:spotify_like/core/configs/theme/app_Color.dart';
import 'package:spotify_like/core/configs/theme/asset/app_png.dart';
import 'package:spotify_like/presentation/chose_mode/pages/choose_mode.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDarkModeEnabled
          ? AppColor.darkBackground
          : AppColor.lightBackground,
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppPng.getStartedPage),
              ),
            ),
          ),

          // Overlay (darkens background only)
          Container(color: Colors.black.withOpacity(0.4)),

          // Content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Column(
                children: [
                  Image.asset(AppPng.logo, width: 196.w, height: 59.h),
                  const Spacer(),
                  Text(
                    "Enjoy Listening to Music",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontFamily: "Satoshi",
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                      fontFamily: "Satoshi",
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Basicappbutton(
                    btnText: "Get Started",
                    btnFontFamily: "Satoshi",
                    btnFontWeight: FontWeight.w700,
                    btnFontSize: 22.sp,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChooseMode(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
