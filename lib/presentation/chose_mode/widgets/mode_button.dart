import 'dart:ui';
import 'package:flutter/material.dart';

class ModeButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  final Color backgroundColor;
  final Color selectedBackgroundColor;
  final Color borderColor;
  final Color selectedBorderColor;
  final Color iconColor;
  final Color textColor;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;

  const ModeButton({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.backgroundColor = const Color.fromRGBO(0, 0, 0, 0.2),
    this.selectedBackgroundColor = const Color.fromRGBO(255, 255, 255, 0.3),
    this.borderColor = const Color.fromRGBO(255, 255, 255, 0.3),
    this.selectedBorderColor = Colors.white,
    this.iconColor = Colors.white,
    this.textColor = Colors.white,
    this.fontFamily = 'Satoshi',
    this.fontSize = 17,
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: 73,
                height: 73,
                decoration: BoxDecoration(
                  color: isSelected ? selectedBackgroundColor : backgroundColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? selectedBorderColor : borderColor,
                    width: 2,
                  ),
                ),
                child: Icon(icon, color: iconColor, size: 40),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
