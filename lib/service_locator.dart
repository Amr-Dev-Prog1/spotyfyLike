import 'package:get_it/get_it.dart';
import 'package:spotify_like/data/repo/auth/auth_repo_imp.dart';
import 'package:spotify_like/data/sources/auth/auth_firebase_serves.dart';
import 'package:spotify_like/domain/repo/auth/auth.dart';
import 'package:spotify_like/domain/usecase/auth/signin_usecase.dart';
import 'package:spotify_like/domain/usecase/auth/sinup_usecase.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerLazySingleton<AuthFirebaseServes>(() => AuthFirebaseServesImpl());
  sl.registerLazySingleton<AuthRepository>(() => AuthRepoImp());
  sl.registerLazySingleton<SinupUsecase>(() => SinupUsecase());
  sl.registerLazySingleton<SigninUsecase>(() => SigninUsecase());
}
