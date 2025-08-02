import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // ✅ IMPORT ScreenUtil
import 'package:spotify_like/core/configs/theme/app_theme.dart';
import 'package:spotify_like/firebase_options.dart';
import 'package:spotify_like/presentation/root/pages/homepage.dart';
import 'package:spotify_like/presentation/splash/pages/splash.dart';
import 'package:spotify_like/presentation/chose_mode/bloc/cubit/get_started_cubit.dart';
import 'package:spotify_like/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies(); // Initialize dependencies
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => GetStartedCubit())],
      child: BlocBuilder<GetStartedCubit, ThemeMode>(
        builder: (context, themeMode) {
          return ScreenUtilInit(
            // ✅ Initialize ScreenUtil
            designSize: const Size(
              375,
              812,
            ), // 👈 اضبط الحجم بناءً على التصميم الأساسي
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeMode,
                home: child, // 👈 استخدم `child` هنا
              );
            },
            child: const Homepage(), // 👈 ضع الشاشة الأولى هنا
          );
        },
      ),
    );
  }
}
