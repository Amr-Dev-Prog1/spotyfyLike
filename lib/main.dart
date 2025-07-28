import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify_like/core/configs/theme/app_theme.dart';
import 'package:spotify_like/presentation/splash/pages/splash.dart';
import 'package:spotify_like/presentation/chose_mode/bloc/cubit/get_started_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetStartedCubit()), // ✅ FIX added here
      ],
      child: BlocBuilder<GetStartedCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode, // ← هذا يغيّر الـ Theme فعلاً حسب الحالة
            home: SplashScreen(), // ← وتأكد أن SplashScreen تؤدي لـ ChooseMode
          );
        },
      ),
    );
  }
}
