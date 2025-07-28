import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:spotify_like/core/configs/theme/asset/app_png.dart';
import 'package:spotify_like/presentation/get_started/pages/get_started.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AppPng.logo, width: 196, height: 59)),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => GetStarted()),
    );
  }
}
