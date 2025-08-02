import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // ✅ import screen util

class Basicappbutton extends StatelessWidget {
  final String btnText;
  final Color btnTextColor;
  final String btnFontFamily;
  final FontWeight btnFontWeight;
  final double btnFontSize;
  final void Function()? onPressed;
  final Color btnColor;
  final double btnHeight;
  final double btnWidth;

  const Basicappbutton({
    super.key,
    required this.btnText,
    required this.btnFontFamily,
    required this.btnFontWeight,
    required this.btnFontSize,
    this.btnColor = const Color(0xFF42C83C),
    this.btnHeight = 92,
    this.btnWidth = 329,
    this.onPressed,
    this.btnTextColor = const Color(0xFFFFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(btnWidth.w, btnHeight.h), // ✅ responsive size
        backgroundColor: btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30.r,
          ), // optional: responsive radius
        ),
      ),
      child: Text(
        btnText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: btnFontSize.sp, // ✅ responsive font size
          fontWeight: btnFontWeight,
          color: btnTextColor,
          fontFamily: btnFontFamily,
        ),
      ),
    );
  }
}
