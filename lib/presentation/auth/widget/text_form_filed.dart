import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_like/common/hleper/is_dark_mode.dart';
import 'package:spotify_like/core/configs/theme/app_Color.dart';

class AuthFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const AuthFormField({
    super.key,
    required this.labelText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.isDarkModeEnabled;
    final bool isObscure = obscureText;

    return SizedBox(
      width: 300.w,
      height: 70.h,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isObscure,
        onChanged: onChanged,
        style: TextStyle(color: isDark ? Colors.white : Colors.black),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 45.h,
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: isDark ? AppColor.lightBackground : AppColor.darkBackground,
          ),
          filled: true,
          fillColor: isDark
              ? AppColor.darkBackground
              : AppColor.lightBackground,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.r)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(
              color: isDark
                  ? AppColor.lightBackground
                  : AppColor.darkBackground,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColor.primary, width: 2),
          ),
        ).applyDefaults(Theme.of(context).inputDecorationTheme),
      ),
    );
  }
}
