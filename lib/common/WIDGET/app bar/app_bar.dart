import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_like/common/hleper/is_dark_mode.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Color? backgroundColor;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    this.title,
    this.backgroundColor,
    this.leading,
    this.actions,
    required this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      centerTitle: centerTitle,
      title: title,
      leading:
          leading ??
          IconButton(
            icon: Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.isDarkModeEnabled
                    ? Colors.white.withOpacity(0.03)
                    : Colors.black.withOpacity(0.03),
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: context.isDarkModeEnabled ? Colors.white : Colors.black,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
