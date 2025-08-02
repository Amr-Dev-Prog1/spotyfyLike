import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_like/common/WIDGET/app%20bar/app_bar.dart';
import 'package:spotify_like/common/WIDGET/button/basicAppButton.dart';
import 'package:spotify_like/common/WIDGET/text%20with%20url/text_url.dart';
import 'package:spotify_like/common/hleper/is_dark_mode.dart';
import 'package:spotify_like/core/configs/theme/app_Color.dart';
import 'package:spotify_like/core/configs/theme/asset/app_png.dart';
import 'package:spotify_like/core/configs/theme/asset/app_vector.dart';
import 'package:spotify_like/data/model/auth/singin_user_req.dart';
import 'package:spotify_like/domain/usecase/auth/signin_usecase.dart';
import 'package:spotify_like/presentation/auth/widget/text_form_filed.dart';
import 'package:spotify_like/presentation/root/pages/homepage.dart';
import 'package:spotify_like/service_locator.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.isDarkModeEnabled;

    return Scaffold(
      backgroundColor: isDark
          ? AppColor.darkBackground
          : AppColor.lightBackground,
      body: Column(
        children: [
          // Optional background gradient

          // Content
          SingleChildScrollView(
            padding: EdgeInsets.all(20.0.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomAppBar(
                    title: Image.asset(AppPng.logo, width: 108.w, height: 33.h),
                    centerTitle: true,
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                      fontFamily: "Satoshi",
                    ),
                  ),
                  SizedBox(height: 20.h),
                  TextUrl(
                    text: 'If you need any support',
                    url: 'click here',
                    onTap: () {},
                    textColor: isDark
                        ? AppColor.lightBackground
                        : AppColor.darkBackground,
                    urlColor: AppColor.primary,
                  ),
                  SizedBox(height: 30.h),

                  /// Email Field
                  AuthFormField(
                    labelText: 'Email',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40.h),

                  /// Password Field
                  AuthFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 20.h),

                  /// Recovery link
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextUrl(
                      text: 'Recovery ',
                      url: 'password',
                      urlColor: AppColor.primary,
                      onTap: () {},
                    ),
                  ),

                  SizedBox(height: 40.h),

                  /// Login Button
                  Basicappbutton(
                    btnHeight: 60.h,
                    btnWidth: 325.w,
                    btnColor: AppColor.primary,
                    btnTextColor: isDark
                        ? AppColor.lightBackground
                        : AppColor.darkBackground,
                    btnText: 'Sing In',
                    btnFontFamily: 'Satoshi',
                    btnFontWeight: FontWeight.normal,
                    btnFontSize: 19.sp,
                    onPressed: () async {
                      var result = await sl<SigninUsecase>().call(
                        SinginUserReq(
                          email: _emailController.text.toString(),
                          password: _passwordController.text.toString(),
                        ),
                      );
                      result.fold(
                        (l) {
                          var snackBar = SnackBar(
                            content: Text(
                              l,
                              style: TextStyle(
                                color: isDark ? Colors.white : Colors.black,
                              ),
                            ),
                            backgroundColor: isDark
                                ? AppColor.darkBackground
                                : AppColor.lightBackground,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        (r) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Homepage(),
                            ),
                            (route) => false,
                          );
                        },
                      );
                    },
                  ),

                  SizedBox(height: 40.h),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          height: 1.5.h,
                          color: isDark
                              ? AppColor.lightBackground
                              : AppColor.darkBackground,
                        ),
                      ),
                      Text(
                        'Or',
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                          fontSize: 17.sp,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          height: 1.5.h,
                          color: isDark
                              ? AppColor.lightBackground
                              : const Color.fromRGBO(13, 12, 12, 1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppVector.google,
                        width: 30.w,
                        height: 30.h,
                      ),
                      SizedBox(width: 50.w),
                      SvgPicture.asset(
                        AppVector.apple,
                        width: 30.w,
                        height: 30.h,
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  TextUrl(
                    text: 'not a member ? ',
                    url: 'register now',
                    onTap: () {},
                    textColor: isDark
                        ? AppColor.lightBackground
                        : AppColor.darkBackground,
                    urlColor: AppColor.primary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
