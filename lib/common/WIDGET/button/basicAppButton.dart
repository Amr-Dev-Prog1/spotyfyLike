import 'package:flutter/material.dart';
import 'package:spotify_like/presentation/chose_mode/pages/choose_mode.dart';

class Basicappbutton extends StatelessWidget {
  final String btnText;
  final String btnFontFamily;
  final FontWeight btnFontWeight; // ✅ Use correct type
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
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(btnWidth, btnHeight),
        backgroundColor: btnColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(
        btnText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: btnFontSize,
          fontWeight: btnFontWeight, // ✅ Fixed
          color: Colors.white,
          fontFamily: btnFontFamily,
        ),
      ),
    );
  }
}
