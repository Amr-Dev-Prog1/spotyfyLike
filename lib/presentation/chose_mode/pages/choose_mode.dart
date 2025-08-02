import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_like/common/WIDGET/button/basicAppButton.dart';
import 'package:spotify_like/common/hleper/is_dark_mode.dart';
import 'package:spotify_like/core/configs/theme/app_Color.dart';
import 'package:spotify_like/core/configs/theme/asset/app_png.dart';
import 'package:spotify_like/presentation/chose_mode/bloc/cubit/get_started_cubit.dart';
import 'package:spotify_like/presentation/chose_mode/widgets/mode_button.dart';
import 'package:spotify_like/presentation/auth/pages/regster_page.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<GetStartedCubit>().state;

    return Scaffold(
      backgroundColor: context.isDarkModeEnabled
          ? AppColor.darkBackground
          : AppColor.lightBackground,

      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppPng.chooseModePage, fit: BoxFit.cover),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(AppPng.logo, width: 196.w, height: 59.h),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 60.h,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Choose Mode",
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontFamily: "Satoshi",
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ModeButton(
                            icon: Icons.light_mode,
                            label: "Light",
                            isSelected: themeMode == ThemeMode.light,
                            onTap: () {
                              context.read<GetStartedCubit>().setLightTheme();
                            },
                            backgroundColor: Colors.black.withOpacity(0.2),
                            selectedBackgroundColor: Colors.white.withOpacity(
                              0.3,
                            ),
                            borderColor: Colors.white.withOpacity(0.3),
                            selectedBorderColor: Colors.white,
                            iconColor: Colors.white,
                            textColor: Colors.white,
                            fontFamily: "Satoshi",
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(width: 50.w),
                          ModeButton(
                            icon: Icons.dark_mode,
                            label: "Dark",
                            isSelected: themeMode == ThemeMode.dark,
                            onTap: () {
                              context.read<GetStartedCubit>().setDarkTheme();
                            },
                            backgroundColor: Colors.black.withOpacity(0.2),
                            selectedBackgroundColor: Colors.white.withOpacity(
                              0.3,
                            ),
                            borderColor: Colors.white.withOpacity(0.3),
                            selectedBorderColor: Colors.white,
                            iconColor: Colors.white,
                            textColor: AppColor.lightBackground,
                            fontFamily: "Satoshi",
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(height: 50.h),
                      Basicappbutton(
                        btnText: "Continue",
                        btnFontFamily: "Satoshi",
                        btnFontWeight: FontWeight.w700,
                        btnFontSize: 22.sp,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const RegsterPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
