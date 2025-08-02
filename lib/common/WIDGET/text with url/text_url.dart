import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextUrl extends StatelessWidget {
  final String text;
  final String url;
  final Color? textColor;
  final Color? urlColor;
  final void Function()? onTap;
  const TextUrl({
    super.key,
    required this.text,
    required this.url,
    this.textColor,
    this.urlColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(fontSize: 16, color: textColor),
        children: [
          TextSpan(
            text: ' $url',
            style: TextStyle(
              color: urlColor,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
