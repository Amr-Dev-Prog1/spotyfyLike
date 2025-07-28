import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class GetStartedCubit extends HydratedCubit<ThemeMode> {
  GetStartedCubit() : super(ThemeMode.dark); // الوضع الافتراضي

  // تبديل بين الوضعين
  void toggleTheme() {
    emit(state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
  }

  void UpdateTheme(ThemeMode themeMode) => emit(themeMode);

  // تفعيل الوضع الداكن
  void setDarkTheme() {
    emit(ThemeMode.dark);
  }

  // تفعيل الوضع الفاتح
  void setLightTheme() {
    emit(ThemeMode.light);
  }

  // استرجاع الحالة من التخزين
  @override
  ThemeMode fromJson(Map<String, dynamic> json) {
    switch (json['theme']) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.dark; // افتراضي في حال كانت القيمة غير معروفة
    }
  }

  // حفظ الحالة في التخزين
  @override
  Map<String, dynamic> toJson(ThemeMode state) {
    return {'theme': state.name}; // Flutter 3.0+ يدعم state.name مباشرة
  }
}
