import 'package:flutter/material.dart';

extension IsDarkMode on BuildContext {
  bool get isDarkModeEnabled {
    return Theme.of(this).brightness == Brightness.dark;
  }
}
