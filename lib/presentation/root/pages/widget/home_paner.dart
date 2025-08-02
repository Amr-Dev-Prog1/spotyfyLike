import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_like/core/configs/theme/asset/app_png.dart';

class HomePaner extends StatelessWidget {
  const HomePaner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: AlignmentDirectional(0, -0.8),
        child: Stack(
          children: [
            Image.asset(
              AppPng.homepagePaner,
              width: 334.w,
              height: 118.h,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 15.h,
              left: 20.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Album',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    'Happier than\never',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Team Impala',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              //AppPng.beilliePaner
              'assets/image/homePagePaner-billie-eilish.png',
              width: 332.w,
              height: 170.h,
            ),
          ],
        ),
      ),
    );
  }
}
